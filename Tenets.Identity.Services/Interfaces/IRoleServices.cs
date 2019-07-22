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
    public interface IRoleServices: IBaseService<Role, IRoleDto>
    {
        Task<IDataPagging> GetRoles(GetAllRoleParameters parameters);
        Task<IResult> IsNameExists(string name, string id);
    }
}
