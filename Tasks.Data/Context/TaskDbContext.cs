using Microsoft.EntityFrameworkCore;
using Tasks.Entities;

namespace Tasks.Data.Context
{
    public class TaskDbContext : DbContext
    {
        public TaskDbContext(DbContextOptions<TaskDbContext> options) : base(options)
        {
        }
        public virtual DbSet<Task> Tasks { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Task>().HasQueryFilter(p => !p.IsDeleted);
            base.OnModelCreating(modelBuilder);
        }
    }
}
