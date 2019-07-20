using System.Threading.Tasks;
using Tenets.Common.Core;

namespace Tenets.Identity.Services.Core
{
    public interface IBaseService<T,TDto,TModel>
    {
        Task<IResponseResult> GetAllAsync();
        Task<IResponseResult> AddAsync(TModel model);
        Task<IResponseResult> UpdateAsync(TModel model);
        Task<IResponseResult> DeleteAsync(string id);
        Task<IResponseResult> GetByIdAsync(string id);
     }
}
