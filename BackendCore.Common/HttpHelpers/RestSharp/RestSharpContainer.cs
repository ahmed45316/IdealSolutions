using System;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using RestSharp;

namespace BackendCore.Common.HttpHelpers.RestSharp
{
    public class RestSharpContainer : IRestSharpContainer
    {
        private readonly RestClient _client;
        private readonly string _serverUri;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public RestSharpContainer(string serverUri, IHttpContextAccessor httpContextAccessor)
        {
            _serverUri = serverUri;
            _httpContextAccessor = httpContextAccessor;
            _client = new RestClient();
        }
        public async Task<T> SendRequest<T>(string uri, Method method, object obj = null, string urlEncoded = null)
        {
            _client.CookieContainer = new CookieContainer();
            var request = new RestRequest($"{_serverUri}{uri}", method);
            _client.Timeout = -1;
            if (method == Method.POST || method == Method.PUT)
            {
                if (urlEncoded != null)
                {
                    request.AddHeader("content-type", "application/x-www-form-urlencoded");
                    request.AddParameter("application/x-www-form-urlencoded", urlEncoded, ParameterType.RequestBody);
                }
                else
                {
                    SetJsonContent(request, obj);
                    request.AddJsonBody(obj);
                }
            }
            //var accessToken = await _httpContextAccessor.HttpContext.GetTokenAsync("access_token");
            //if (accessToken != null) request.AddHeader("Authorization", "Bearer " + accessToken);
            var response = await _client.ExecuteAsync<T>(request);
            T data;
            try { data = Newtonsoft.Json.JsonConvert.DeserializeObject<T>(response.Content); }
            catch (Exception) { data = default(T); }
            return data == null ? response.Data : data;
        }
        private void SetJsonContent(RestRequest request, object obj)
        {
            request.RequestFormat = DataFormat.Json;
            request.JsonSerializer = NewtonsoftJsonSerializer.Default;
            request.AddJsonBody(obj);
        }
    }
}
