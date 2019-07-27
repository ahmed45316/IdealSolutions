using System;
using System.Threading.Tasks;
using Tenets.Common.Core;

namespace Codes.Services.Core
{
    public interface IBaseService<T,TDto>
    {
        Task<IResult> GetAllAsync(bool disableTracking = false);
        Task<IResult> AddAsync(TDto model,string userId);
        Task<IResult> UpdateAsync(TDto model, string userId);
        Task<IResult> DeleteAsync(Guid id);
        Task<IResult> GetByIdAsync(Guid id);
     }
}
