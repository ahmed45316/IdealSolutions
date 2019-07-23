using System;
using Tenets.Common.ServicesCommon.Identity.Interface;

namespace Tenets.Identity.Services.Dto
{
    public class UserLoginReturn : IUserLoginReturn
    {
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public DateTime TokenValidTo { get; set; }
        public Guid UserId { get; set; }
        public string NameEn { get; set; }
        public string NameAr { get; set; }
        public string ImagePath { get; set; }
    }
}
