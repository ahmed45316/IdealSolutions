using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using LinqKit;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Services
{
    public class CarServices : BaseService<Car, CarDto>, ICarServices
    {
        public CarServices(IServiceBaseParameter<Car> businessBaseParameter, IHttpContextAccessor httpContextAccessor) : base(businessBaseParameter, httpContextAccessor)
        {
        }

        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<CarFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<CarDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Car, bool>> PredicateBuilderFunction(CarFilter filter)
        {
            var predicate = PredicateBuilder.New<Car>(true);
            if (!string.IsNullOrWhiteSpace(filter.PlateNumber))
            {
                predicate = predicate.And(b => b.PlateNumber.ToLower().Contains(filter.PlateNumber.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(filter.Model))
            {
                predicate = predicate.And(b => b.Model.ToLower().Contains(filter.Model.ToLower()));
            }
            return predicate;
        }
    }
}
