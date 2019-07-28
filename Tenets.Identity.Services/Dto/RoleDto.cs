using System;
using Tenets.Common.ServicesCommon.Identity.Interface;

namespace Tenets.Identity.Services.Dto
{
    public class RoleDto : IRoleDto
    {
        public Guid? Id { get; set; }
        public string Name { get; set; }
        public bool IsDeleted { get; set; }
        public int? UsersRoleCount { get; set; } = 0;
    }
}
