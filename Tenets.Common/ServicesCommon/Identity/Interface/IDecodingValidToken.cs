using System.Security.Claims;

namespace Tenets.Common.ServicesCommon.Identity.Interface
{
    public interface IDecodingValidToken
    {
        ClaimsPrincipal ClaimsPrincipal { get; set; }
    }
}
