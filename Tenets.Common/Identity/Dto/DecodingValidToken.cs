using System.Security.Claims;
using Tenets.Common.Identity.Interface;

namespace Tenets.Common.Identity.Dto
{
    public class DecodingValidToken : IDecodingValidToken
    {
        public ClaimsPrincipal ClaimsPrincipal { get; set; }
    }
}
