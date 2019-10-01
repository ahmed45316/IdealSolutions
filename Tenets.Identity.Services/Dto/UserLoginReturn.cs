using System;
namespace Tenets.Identity.Services.Dto
{
    public class UserLoginReturn 
    {
        public string Token { get; set; }
        public DateTime TokenValidTo { get; set; }
        public Guid UserId { get; set; }
        public string NameEn { get; set; }
        public string NameAr { get; set; }
        public string RoleName { get; set; }
    }
}
