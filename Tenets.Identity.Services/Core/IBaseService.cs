using System;
using System.Threading.Tasks;
using Tenets.Common.Core;

namespace Tenets.Identity.Services.Core
{
    public interface IBaseService<T,TDto>
    {
        Task<IResponseResult> GetAllAsync();
        Task<IResponseResult> AddAsync(TDto model);
        Task<IResponseResult> UpdateAsync(TDto model);
        Task<IResponseResult> DeleteAsync(Guid id);
        Task<IResponseResult> GetByIdAsync(Guid id);
     }
}
