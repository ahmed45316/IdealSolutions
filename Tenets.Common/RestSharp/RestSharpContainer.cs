using System;
using System.Collections.Generic;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using RestSharp;

namespace Tenets.Common.RestSharp
{
    public class RestSharpContainer : IRestSharpContainer
    {
        private readonly RestClient client;
        private readonly string _serverUri;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public RestSharpContainer(string serverUri, IHttpContextAccessor httpContextAccessor)
        {
            _serverUri = serverUri;
            _httpContextAccessor = httpContextAccessor;
            client = new RestClient();
        }
        public async Task<T> SendRequest<T>(string uri, Method method, object obj = null)
        {
            client.CookieContainer = new CookieContainer();
            var request = new RestRequest($"{_serverUri}{uri}", method);
            if (method == Method.POST || method == Method.PUT)
            {
                request.AddJsonBody(obj);
            }
            var accessToken = await _httpContextAccessor.HttpContext.GetTokenAsync("access_token");
            if (accessToken != null) request.AddParameter("Authorization", "Bearer " + accessToken, ParameterType.HttpHeader);
            var response = await client.ExecuteTaskAsync<T>(request);
            return response.Data;
        }
    }
}
