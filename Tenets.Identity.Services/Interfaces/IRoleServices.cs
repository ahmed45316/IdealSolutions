using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Dto;

namespace Tenets.Identity.Services.Interfaces
{
    public interface IRoleServices: IBaseService<Role, RoleDto>
    {

    }
}
