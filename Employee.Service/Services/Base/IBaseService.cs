using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using BackendCore.Common.Core;

namespace Employee.Service.Services.Base
{
    public interface IBaseService<T, TDto>
    {
        Task<IResult> GetAllAsync();
        Task<IResult> AddAsync(TDto model);
        Task<IResult> AddListAsync(List<TDto> model);
        Task<IResult> UpdateAsync(TDto model);
        Task<IResult> DeleteAsync(Guid id);
        Task<IResult> GetByIdAsync(Guid id);
    }
}