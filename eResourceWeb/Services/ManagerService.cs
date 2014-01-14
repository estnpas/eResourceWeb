using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Caching;
using System.Web;
using eResourceWeb.DAL;
using eResourceWeb.DTO;


namespace eResourceWeb.Services
{
    public class ManagerService
    {
        private static ManagerService instance;

        //Get the default MemoryCache to cache objects in memory
        private static ObjectCache cache = MemoryCache.Default;
        private CacheItemPolicy policy = null;
        private CacheEntryRemovedCallback callback = null;

        //  We need to retrieve manager's name
        private static string managerNameSQLQuery = "select "
                                  + "Id AS Id, "
                                + "Name AS Name, "
                                + "ManagerType AS ManagerType "
                            + "FROM dbo.ManagerMaster "
                            + "WHERE Id = @p0 ";

        //Context to access database
        private ResourceWebContext db = new ResourceWebContext();

        private ManagerService() {}

        public static ManagerService Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new ManagerService();
                }
                return instance;
            }
        }

        public ManagerMasterDTO GetManger(int id)
        {
            string idString = id.ToString();

            policy = new CacheItemPolicy();
            policy.Priority = CacheItemPriority.Default;

            if (cache.Contains(idString))
            {
                return (ManagerMasterDTO)cache.Get(idString);
            }
            else
            {
                try
                {
                    var manager = db.Database.SqlQuery<ManagerMasterDTO>(managerNameSQLQuery, id).Single();
                    cache.Add(idString, manager, policy);
                    return manager;
                }
                catch (Exception e)
                {
                    Console.WriteLine("{0} Exception caught.", e);
                    return null;
                }
            }
        }
    }

 
}