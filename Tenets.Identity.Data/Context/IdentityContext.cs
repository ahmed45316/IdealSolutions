using Microsoft.EntityFrameworkCore;
using Tenets.Identity.Data.SeedData;
using Tenets.Identity.Entities;

namespace Tenets.Identity.Data.Context
{
    public class IdentityContext : DbContext
    {
        private readonly IDataInitialize _dataInitialize;
        public IdentityContext(DbContextOptions<IdentityContext> options, IDataInitialize dataInitialize) : base(options)
        {
            _dataInitialize = dataInitialize;
        }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            #region Seed Data
            modelBuilder.Entity<User>().HasData(_dataInitialize.AddSystemAdmin());
            modelBuilder.Entity<Role>().HasData(_dataInitialize.AddDefaultRole());
            #endregion
        }
    }
}
