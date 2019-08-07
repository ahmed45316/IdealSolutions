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
        public virtual DbSet<PolicyDetail> PolicyDetails { get; set; }

    }
}
