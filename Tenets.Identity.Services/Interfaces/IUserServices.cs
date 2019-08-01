using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.OptionModel;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Identity.Interface;
using Tenets.Common.ServicesCommon.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;

namespace Tenets.Identity.Services.Interfaces
{
    public interface IUserServices: IBaseService<User, IUserDto>
    {
        Task<IDataPagging> GetUsers(BaseParam<UserFilter> filter);
        Task<IResult> IsUsernameExists(string name, Guid? id);
        Task<IResult> IsEmailExists(string email, Guid? id);
        Task<IResult> IsPhoneExists(string phone, Guid? id);
        Task<Select2PagedResult> GetUsersSelect2(string searchTerm, int pageSize, int pageNumber);
        Task<IEnumerable<Select2OptionModel>> GetUserAssignedSelect2(Guid id);
        Task<IResult> SaveUserAssigned(AssignUserOnRoleParameters parameters);
    }
}
