using System;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Identity.Interface
{
    public interface IUserDto : IPrimaryKeyField<Guid?>
    {
        string Email { get; set; }
        bool EmailConfirmed { get; set; }
        string PasswordHash { get; set; }
        string SecurityStamp { get; set; }
        string PhoneNumber { get; set; }
        bool PhoneNumberConfirmed { get; set; }
        bool TwoFactorEnabled { get; set; }
        DateTime? LockoutEndDateUtc { get; set; }
        bool LockoutEnabled { get; set; }
        int AccessFailedCount { get; set; }
        string UserName { get; set; }
        bool IsDeleted { get; set; }
        string ImgPath { get; set; }
        string Roles { get; set; }
        string ImgExtinsion { get; set; }
    }
}
