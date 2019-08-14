using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using LinqKit;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
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
    public class PolicyServices : BaseService<Policy, IPolicyDto>, IPolicyServices
    {
        public PolicyServices(IServiceBaseParameter<Policy> businessBaseParameter, IHttpContextAccessor httpContextAccessor) : base(businessBaseParameter, httpContextAccessor)
        {

        }
        public async override Task<IResult> UpdateAsync(IPolicyDto model)
        {
            try 
            {
                await base.DeleteAsync(model.Id??new Guid(""));
                await base.AddAsync(model);
                return result;
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, result.Message);
                return result;
            }
        }
        public async override Task<IResult> GetByIdAsync(Guid id)
        {
            try
            {
                var query = await _unitOfWork.Repository.FirstOrDefaultAsync(q=>q.Id==id,include:source=>source.Include(p=>p.PolicyDetails));
                var data = Mapper.Map<PolicyDto>(query);
                return ResponseResult.PostResult(result: data, status: HttpStatusCode.OK, message: "");
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, result.Message);
                return result;
            }
        }
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<PolicyFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<PolicyDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Policy, bool>> PredicateBuilderFunction(PolicyFilter filter)
        {
            var predicate = PredicateBuilder.New<Policy>(true);
            if (filter.PolicyDate!=null)
            {
                predicate = predicate.And(b => b.PolicyDateTime == filter.PolicyDate);
            }
            
            return predicate;
        }

    }
}
