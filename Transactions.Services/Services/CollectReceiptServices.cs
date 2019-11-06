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
using Newtonsoft.Json;
using Tenets.Common.Core;
using Tenets.Common.Enums;
using Tenets.Common.Extensions;
using Tenets.Common.RestSharp;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.Entities.Entites;
using Transactions.Services.Core;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;
using Transactions.Services.UnitOfWork;

namespace Transactions.Services.Services
{
    public class CollectReceiptServices : BaseService<CollectReceipt, CollectReceiptDto>, ICollectReceiptServices
    {
        private readonly IUnitOfWork<Policy> _policyDetailUnitOfWork;
        private readonly IRestSharpContainer _restSharpContainer;
        public CollectReceiptServices(IServiceBaseParameter<CollectReceipt> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IUnitOfWork<Policy> policyDetailUnitOfWork, IRestSharpContainer restSharpContainer) : base(businessBaseParameter, httpContextAccessor)
        {
            _policyDetailUnitOfWork = policyDetailUnitOfWork;
            _restSharpContainer = restSharpContainer;
        }
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<CollectReceiptFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var predicate = ExpressionBuilder.GetPredicate<Policy,CollectReceiptFilter>(filter.Filter);
                var query = await _policyDetailUnitOfWork.Repository.FindPaggedAsync(predicate: predicate, skip: offset, take: limit, filter.OrderByValue, include: source => source.Include(c => c.CollectReceipts));
                var data = Mapper.Map<IEnumerable<CollectReceiptPolicyDto>>(query.Item2);

                data = data.Select(q =>
                {
                    decimal? PreviouslyPaidForCollect = query.Item2.FirstOrDefault(p => p.Id == q.Id).CollectReceipts?.Where(r => r?.CollectReceiptType == CollectReceiptType.Collect).Sum(r => r?.Paid) ?? 0;
                    decimal? PreviouslyPaidForReceipt = query.Item2.FirstOrDefault(p => p.Id == q.Id).CollectReceipts?.Where(r => r?.CollectReceiptType == CollectReceiptType.Receipt).Sum(r => r?.Paid) ?? 0;
                    q.PreviouslyPaidForCollect = PreviouslyPaidForCollect;
                    q.PreviouslyPaidForReceipt = PreviouslyPaidForReceipt;
                    q.ResidualForCollect = (q.TotalPriceAfterTax - PreviouslyPaidForCollect) ?? 0;
                    q.ResidualForReceipt = (q.TotalPriceAfterTax + PreviouslyPaidForReceipt) ?? 0;
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

        public IResult GetAllPaymentType()
        {
            var values = Enum.GetValues(typeof(PaymentType)).Cast<PaymentType>();
            var los = new List<PaymentTypeDto>();
            foreach (var item in values)
            {
                los.Add(new PaymentTypeDto() { Id = (int)item, NameAr = item.ToName() });
            }
            return new ResponseResult(los, status: HttpStatusCode.OK, message: "");
        }

    }
}
