using System;
using System.Threading.Tasks;
using BackendCore.Common.Abstraction.Repository;
using BackendCore.Common.Abstraction.UnitOfWork;
using Employee.Data.Repository;
using Microsoft.EntityFrameworkCore;

namespace Employee.Data.UnitOfWork
{
    public class UnitOfWork<T> : IUnitOfWork<T> where T : class
    {
        private DbContext _context;
        public IRepository<T> Repository { get; }

        public UnitOfWork(DbContext context)
        {
            _context = context;
            Repository = new Repository<T>(_context);
        }
        public async Task<int> SaveChanges()
        {
            return await _context.SaveChangesAsync();
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (!disposing)
            {
                return;
            }

            if (_context == null)
            {
                return;
            }

            _context.Dispose();
            _context = null;
        }
    }
}