using System.Security.Claims;
using Tenets.Common.ServicesCommon.Identity.Interface;

namespace Tenets.Identity.Services.Dto
{
    public class DecodingValidToken : IDecodingValidToken
    {
        public ClaimsPrincipal ClaimsPrincipal { get; set; }
    }
}
