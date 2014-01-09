using eResourceWeb.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace eResourceWeb.DAL
{
    public class ResourceWebContext : DbContext
    {
        
        public ResourceWebContext()
        {
            Database.SetInitializer<ResourceWebContext>(null);
        }

        public DbSet<ResourceMaster> ResourceMaster { get; set; }
        public DbSet<ResourceMasterAttributesModel> ResourceMasterAttributesModel { get; set; }
    }
}
