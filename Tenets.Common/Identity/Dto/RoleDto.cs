using System;
using Tenets.Common.Identity.Interface;

namespace Tenets.Common.Identity.Dto
{
    public class RoleDto : IRoleDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public bool IsDeleted { get; set; }
        public int? UsersRoleCount { get; set; } = 0;
    }
}
