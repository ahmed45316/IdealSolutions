using System;
using System.Threading.Tasks;
using Tenets.Common.Core;

namespace Transactions.Services.Core
{
    public interface IBaseService<T,TDto>
    {
        Task<IResult> GetAllAsync(bool disableTracking = false);
        Task<IResult> AddAsync(TDto model);
        Task<IResult> UpdateAsync(TDto model);
        Task<IResult> DeleteAsync(Guid id);
        Task<IResult> GetByIdAsync(Guid id);
     }
}
