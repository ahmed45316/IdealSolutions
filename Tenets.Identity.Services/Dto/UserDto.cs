using System;
using Tenets.Common.Core;

namespace Tenets.Identity.Services.Dto
{
    public class UserDto : IPrimaryKeyField<Guid?>
    {
        public Guid? Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public Guid RoleId { get; set; }
        public string RolName { get; set; }
        public virtual RoleDto Role { get; set; }
        public Guid BranchId { get; set; }
        public Guid? RepresentativeId { get; set; }
    }
}
