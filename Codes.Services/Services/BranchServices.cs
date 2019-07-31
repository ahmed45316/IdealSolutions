using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Interfaces;
using LinqKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Interface;
using Tenets.Common.ServicesCommon.Codes.Parameters;

namespace Codes.Services.Services
{
    public class BranchServices : BaseService<Branch, IBranchDto>, IBranchServices
    {
        public BranchServices(IServiceBaseParameter<Branch> businessBaseParameter) : base(businessBaseParameter)
        {

        }
        public async Task<IDataPagging> GetAllPaggedAsync(BranchSearchCriteriaParameters parameters)
        {
            try
            {
                int limit = parameters.PageSize;
                int offset = ((--parameters.PageNumber)*parameters.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(parameters),skip:offset, take: limit,parameters.OrderByValue);
                var data = Mapper.Map<IEnumerable<Branch>, IEnumerable<IBranchDto>>(query.Item2);
                return new DataPagging(++parameters.PageNumber, parameters.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0,0,0,result);
            }
        }
        static Expression<Func<Branch, bool>> PredicateBuilderFunction(BranchSearchCriteriaParameters parameters)
        {
            var predicate = PredicateBuilder.New<Branch>(true);
            if (parameters.CompanyId!=null)
            {
                predicate = predicate.And(b => b.CompanyId == parameters.CompanyId);
            }
            if (!string.IsNullOrWhiteSpace(parameters.NameAr))
            {
                predicate = predicate.And(b => b.NameAr.ToLower().Contains(parameters.NameAr.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(parameters.NameEn))
            {
                predicate = predicate.And(b => b.NameEn.ToLower().Contains(parameters.NameEn.ToLower()));
            }
            return predicate;
        }
    }
}
