using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using LinqKit;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using Tenets.Common.Core;
using Tenets.Common.Extensions;
using Tenets.Common.RestSharp;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.Entities.Entities;
using Transactions.Services.Core;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;

namespace Transactions.Services.Services
{
    public class OpeningBalanceServices : BaseService<OpeningBalance, OpeningBalanceDto>, IOpeningBalanceServices
    {
        private readonly IRestSharpContainer _restSharpContainer;
        public OpeningBalanceServices(IServiceBaseParameter<OpeningBalance> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IRestSharpContainer restSharpContainer) : base(businessBaseParameter, httpContextAccessor)
        {
            _restSharpContainer = restSharpContainer;
        }

        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<OpeningBalanceFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var predicate = ExpressionBuilder.GetPredicate<OpeningBalance, OpeningBalanceFilter>(filter.Filter);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: predicate, skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<OpeningBalanceDto>>(query.Item2);

                var serviceResult = await _restSharpContainer.SendRequest<Result>("L/Lookups/GetTypeNameForOpeningBalance", RestSharp.Method.POST, data);
                if (serviceResult == null && serviceResult.Data == null)
                {
                    return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
                }
                var jsonString = JsonConvert.SerializeObject(serviceResult.Data);
                var namesWithType = JsonConvert.DeserializeObject<List<NameByTypeDto>>(jsonString);
                data = data.Select(q =>
                {
                    var type = namesWithType.FirstOrDefault(t => t.Id == q.TypeId && t.Type == q.Type);
                    q.NameAr = type.NameAr;
                    q.NameEn = type.NameEn;
                    return q;
                });



                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }

    }
}
