using System;
using System.Collections.Generic;
using System.Linq;
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
using Transactions.Services.UnitOfWork;

namespace Transactions.Services.Services
{
    public class ClaimCustomerServices : BaseService<ClaimCustomer, IClaimCustomerDto>, IClaimCustomerServices
    {
        private readonly IUnitOfWork<PolicyDetail> _policyDetailUnitOfWork;
        public ClaimCustomerServices(IServiceBaseParameter<ClaimCustomer> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IUnitOfWork<PolicyDetail> policyDetailUnitOfWork) : base(businessBaseParameter, httpContextAccessor)
        {
            _policyDetailUnitOfWork = policyDetailUnitOfWork;
        }
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<ClaimCustomerFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _policyDetailUnitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue,include: source=>source.Include(c=>c.ClaimCustomers));
                var data = Mapper.Map<IEnumerable<PolicyDetailDto>>(query.Item2);

                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<PolicyDetail, bool>> PredicateBuilderFunction(ClaimCustomerFilter filter)
        {
            var predicate = PredicateBuilder.New<PolicyDetail>(true);
            predicate = predicate.And(b => b.PolicyDetailDatetime >= filter.StartDate && b.PolicyDetailDatetime <= filter.EndDate && !b.ClaimCustomers.Any());
            if (filter.CustomerId != null)
            {
                predicate = predicate.And(b => b.CustomerId == filter.CustomerId);
            }
            if (filter.CustomerCategoryId != null)
            {
                predicate = predicate.And(b => b.CustomerCategoryId == filter.CustomerCategoryId);
            }
            if (filter.InvoicTypeId != null)
            {
                predicate = predicate.And(b => b.InvoicTypeId == filter.InvoicTypeId);
            }
            return predicate;
        }
    }
}
