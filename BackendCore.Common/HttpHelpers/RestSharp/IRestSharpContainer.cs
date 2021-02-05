using System.Threading.Tasks;
using RestSharp;

namespace BackendCore.Common.HttpHelpers.RestSharp
{
    public interface IRestSharpContainer
    {
        Task<T> SendRequest<T>(string uri, Method method, object obj = null, string urlEncoded = null);
    }
}
