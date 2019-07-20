using System;

namespace Tenets.Common.Identity.Interface
{
    public interface IUserLoginReturn 
    {
        string Token { get; set; }
        string RefreshToken { get; set; }
        DateTime TokenValidTo { get; set; }
        Guid UserId { get; set; }
        string NameEn { get; set; }
        string NameAr { get; set; }
        string ImagePath { get; set; }
    }
}
