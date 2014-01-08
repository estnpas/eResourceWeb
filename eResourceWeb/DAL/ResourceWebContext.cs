using eResourceWeb.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace eResourceWeb.DAL
{
    public class ResourceWebContext : DbContext
    {
        public DbSet<ResourceMaster> ResourceMaster { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}
