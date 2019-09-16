using RestSharp;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Tenets.Common.RestSharp
{
   public interface IRestSharpContainer
    {
        Task<T> SendRequest<T>(string uri, Method method, object obj = null);
    }
}
