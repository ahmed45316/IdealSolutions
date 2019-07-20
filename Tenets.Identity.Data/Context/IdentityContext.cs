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
        public virtual DbSet<UserClaim> UserClaims { get; set; }
        public virtual DbSet<UserLogin> UserLogins { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UsersRole> UsersRoles { get; set; }
        public virtual DbSet<Menu> Menu { get; set; }
        public virtual DbSet<MenuRole> MenuRoles { get; set; }
        public DbSet<RefreshToken> RefreshTokens { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            #region Seed Data
            modelBuilder.Entity<User>().HasData(_dataInitialize.AddSystemAdmin());
            modelBuilder.Entity<Role>().HasData(_dataInitialize.AddDefaultRole());
            modelBuilder.Entity<UsersRole>().HasData(_dataInitialize.AddUserRole());
            modelBuilder.Entity<Menu>().HasData(_dataInitialize.addMenus());
            #endregion
        }
    }
}
