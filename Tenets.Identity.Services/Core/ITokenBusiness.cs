using Microsoft.AspNetCore.Mvc;
using Tenets.Identity.Services.Dto;

namespace Tenets.Identity.Services.Core
{
    public interface ITokenBusiness
    {
        UserLoginReturn GenerateJsonWebToken(UserDto userInfo, string role);      
    }
}
