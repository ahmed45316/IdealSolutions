using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Dto;

namespace Tenets.Identity.Services.Interfaces
{
    public interface IUserServices: IBaseService<User, UserDto>
    {
        Task<IDataPagging> GetUsers(BaseParam<UserFilter> filter);
        Task<bool> IsSuperAdmin(Guid userId);
    }
}
