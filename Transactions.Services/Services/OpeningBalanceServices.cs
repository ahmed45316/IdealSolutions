using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using LinqKit;
using Microsoft.AspNetCore.Http;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Interface;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.Entities.Entites;
using Transactions.Services.Core;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;

namespace Transactions.Services.Services
{
    public class OpeningBalanceServices : BaseService<OpeningBalance, IOpeningBalanceDto>, IOpeningBalanceServices
    {
        protected internal OpeningBalanceServices(IServiceBaseParameter<OpeningBalance> businessBaseParameter, IHttpContextAccessor httpContextAccessor) : base(businessBaseParameter, httpContextAccessor)
        {
        }

        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<OpeningBalanceFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<OpeningBalanceDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<OpeningBalance, bool>> PredicateBuilderFunction(OpeningBalanceFilter filter)
        {
            var predicate = PredicateBuilder.New<OpeningBalance>(true);
            if (filter.OpeningBalanceFilterDate != null)
            {
                predicate = predicate.And(b => b.OpeningBlanceDate == filter.OpeningBalanceFilterDate);
            }
            if (filter.Type != null)
            {
                predicate = predicate.And(b => b.Type == filter.Type);
            }
            if (filter.TypeId != null)
            {
                predicate = predicate.And(b => b.TypeId == filter.TypeId);
            }
            return predicate;
        }
    }
}
