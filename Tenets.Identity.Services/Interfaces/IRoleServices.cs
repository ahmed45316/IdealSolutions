using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Identity.Dto;
using Tenets.Common.Identity.Interface;
using Tenets.Common.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;

namespace Tenets.Identity.Services.Interfaces
{
    public interface IRoleServices: IBaseService<Role, IRoleDto, RoleDto>
    {
        Task<IDataPagging> GetRoles(GetAllRoleParameters parameters);
        Task<IResponseResult> GetRole(Guid Id);
        Task<IResponseResult> UpdateRole(IRoleDto model);
        Task<IResponseResult> RemoveRoleById(Guid id);
        Task<IResponseResult> IsNameExists(string name, string id);
    }
}
