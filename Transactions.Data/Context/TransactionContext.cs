using System.Linq;
using Transactions.Data.Configuration;
using Microsoft.EntityFrameworkCore;
using Transactions.Entities.Entities;

namespace Transactions.Data.Context
{
    public class TransactionContext : DbContext
    {
        public TransactionContext(DbContextOptions<TransactionContext> options) : base(options)
        {
        }
        public virtual DbSet<Policy> Policies { get; set; }
        public virtual DbSet<OpeningBalance> OpeningBalances { get; set; }
        public virtual DbSet<ClaimCustomer> ClaimCustomers { get; set; }
        public virtual DbSet<CollectReceipt> CollectReceipts { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Model.GetEntityTypes().SelectMany(e => e.GetForeignKeys()).ToList().ForEach(foreignKey => foreignKey.DeleteBehavior = DeleteBehavior.Restrict);
            //modelBuilder.HasSequence<long>("PolicyNumbers").StartsAt(1000).IncrementsBy(1);
            modelBuilder.ApplyConfiguration(new CollectReceiptConfiguration());
            modelBuilder.ApplyConfiguration(new PolicyConfiguration());
        }
    }
}
