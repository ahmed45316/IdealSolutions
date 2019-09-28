using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Interfaces;
using Tenets.Identity.Services.Dto;

namespace Tenets.Identity.Services.Services
{
    public class RoleServices : BaseService<Role, RoleDto>, IRoleServices
    {
        public RoleServices(IServiceBaseParameter<Role> businessBaseParameter) : base(businessBaseParameter)
        {
        }
    }
}
