using System;
using Tenets.Common.ServicesCommon.Identity.Interface;

namespace Tenets.Identity.Services.Dto
{
    public class UserDto : IUserDto
    {
        public Guid? Id { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; } = false;
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public string PhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; } = false;
        public bool TwoFactorEnabled { get; set; } = false;
        public DateTime? LockoutEndDateUtc { get; set; }
        public bool LockoutEnabled { get; set; } = false;
        public int AccessFailedCount { get; set; }
        public string UserName { get; set; }
        public bool IsDeleted { get; set; } = false;
        public string Roles { get; set; }
        public string ImgPath { get; set; }
        public string ImgExtinsion { get; set; }
    }
}
