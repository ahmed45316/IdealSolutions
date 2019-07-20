using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Identity.Parameters;

namespace Tenets.Identity.Services.Interfaces
{
    public interface ILoginServices
    {
        Task<IResponseResult> Login(byte type, LoginParameters parameters);
    }
}
