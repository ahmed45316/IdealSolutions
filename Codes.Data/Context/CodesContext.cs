using Codes.Entities.Entities;
using Microsoft.EntityFrameworkCore;

namespace Codes.Data.Context
{
    public class CodesContext : DbContext
    {
        public CodesContext(DbContextOptions<CodesContext> options) : base(options)
        {
        }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Branch> Branches { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
           
        }
    }
}
