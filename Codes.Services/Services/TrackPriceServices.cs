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
    public class TrackPriceServices : BaseService<TrackPrice, ITrackPriceDto>, ITrackPriceServices
    {
        public TrackPriceServices(IServiceBaseParameter<TrackPrice> businessBaseParameter) : base(businessBaseParameter)
        {
            
        }
        public async Task<IDataPagging> GetAllPaggedAsync(TrackPriceFilter filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<TrackPrice>, IEnumerable<ITrackPriceDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<TrackPrice, bool>> PredicateBuilderFunction(TrackPriceFilter filter)
        {
            var predicate = PredicateBuilder.New<TrackPrice>(true);
            if (filter.CustomerId != null)
            {
                predicate = predicate.And(b => b.CustomerId == filter.CustomerId);
            }
            return predicate;
        }
    }
}
