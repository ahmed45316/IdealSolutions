using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Identity.Interface;

namespace Tenets.Identity.Services.Core
{
    public interface ITokenBusiness
    {
        IUserLoginReturn GenerateJsonWebToken(IUserDto userInfo, string roles,  string refreshToken="" );        
        IDecodingValidToken GetUserDataFromToken(ControllerBase controller);
    }
}
