using Microsoft.EntityFrameworkCore;

namespace Employee.Data.Context
{
    public class EmployeeDbContext : DbContext
    {
        public EmployeeDbContext(DbContextOptions<EmployeeDbContext> options) : base(options)
        {
        }
        public virtual DbSet<Entities.Employee> Employees { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Entities.Employee>().HasQueryFilter(p => !p.IsDeleted);
            base.OnModelCreating(modelBuilder);
        }
    }
}
