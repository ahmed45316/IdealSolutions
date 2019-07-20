using System;
using System.Threading.Tasks;
using Tenets.Infrastructure.Repository;

namespace Tenets.Identity.Services.UnitOfWork
{
    public interface IUnitOfWork<T> : IDisposable where T : class
    {
        IRepository<T> Repository { get; }
        Task<int> SaveChanges();
        void StartTransaction();
        void CommitTransaction();
        void Rollback();
    }
}
