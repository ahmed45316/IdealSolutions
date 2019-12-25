﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using LinqKit;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
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
using Transactions.Services.UnitOfWork;

namespace Transactions.Services.Services
{
    public class ClaimCustomerServices : BaseService<ClaimCustomer, ClaimCustomerDto>, IClaimCustomerServices
    {
        private readonly IUnitOfWork<Policy> _policyDetailUnitOfWork;
        private readonly IRestSharpContainer _restSharpContainer;
        public ClaimCustomerServices(IServiceBaseParameter<ClaimCustomer> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IUnitOfWork<Policy> policyDetailUnitOfWork,IRestSharpContainer restSharpContainer) : base(businessBaseParameter, httpContextAccessor)
        {
            _policyDetailUnitOfWork = policyDetailUnitOfWork;
            _restSharpContainer = restSharpContainer;
        }
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<ClaimCustomerFilter> filter)
        {
            try
            {
                var limit = filter.PageSize;
                var offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _policyDetailUnitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue,include: source=>source.Include(c=>c.ClaimCustomers).Include(c=>c.Customer));
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
        static Expression<Func<Policy, bool>> PredicateBuilderFunction(ClaimCustomerFilter filter)
        {
            ExpressionStarter<Policy> predicate = ExpressionBuilder.GetPredicate<Policy,ClaimCustomerFilter>(filter);
            predicate = predicate.And(b => b.PolicyDatetime >= filter.StartDate && b.PolicyDatetime <= filter.EndDate && !b.ClaimCustomers.Any());
            return predicate;
        }
    }
}
