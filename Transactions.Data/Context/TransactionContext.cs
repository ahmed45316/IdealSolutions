using Transactions.Data.Configuration;
using Microsoft.EntityFrameworkCore;
using Transactions.Entities.Entites;

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
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasSequence<long>("PolicyNumbers").StartsAt(1000).IncrementsBy(1);
            modelBuilder.ApplyConfiguration(new CollectReceiptConfiguration());
            modelBuilder.ApplyConfiguration(new PolicyConfiguration());
        }
    }
}
