using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Parameters;

namespace Tenets.Identity.Services.Interfaces
{
    public interface ILoginServices
    {
        Task<IResult> Login(LoginParameters parameters);
    }
}
