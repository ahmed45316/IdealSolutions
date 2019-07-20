using System;
using Tenets.Common.Identity.Interface;

namespace Tenets.Common.Identity.Dto
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
