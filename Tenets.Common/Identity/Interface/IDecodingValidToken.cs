using System.Security.Claims;

namespace Tenets.Common.Identity.Interface
{
    public interface IDecodingValidToken
    {
        ClaimsPrincipal ClaimsPrincipal { get; set; }
    }
}
