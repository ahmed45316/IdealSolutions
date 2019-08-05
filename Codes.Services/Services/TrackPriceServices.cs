using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using Codes.Services.UnitOfWork;
using LinqKit;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
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
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Services
{
    public class TrackPriceServices : BaseService<TrackPrice, TrackPriceDto>, ITrackPriceServices
    {
        private readonly IUnitOfWork<CarType> _carTypeUnitOfWork;
        public TrackPriceServices(IServiceBaseParameter<TrackPrice> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IUnitOfWork<CarType> carTypeUnitOfWork) : base(businessBaseParameter, httpContextAccessor)
        {
            _carTypeUnitOfWork = carTypeUnitOfWork;
        }

        public async override Task<IResult> DeleteAsync(Guid id)
        {
            try
            {
                var entityToDelete = await _unitOfWork.Repository.FirstOrDefaultAsync(t => t.Id == id, include: source => source
                      .Include(t => t.TrackPriceDetails)
                      .ThenInclude(t => t.TrackPriceDetailCarTypes));
                _unitOfWork.Repository.Remove(entityToDelete);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted, message: "Data Updated Successfully");
                }
                return result;
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, result.Message);
                return result;
            }
        }
        public async override Task<IResult> GetAllAsync(bool disableTracking = false)
        {
            try
            {
                var query = await _unitOfWork.Repository.GetAllAsync(disableTracking: disableTracking, include: source => source
                    .Include(t => t.TrackPriceDetails)
                    .ThenInclude(t => t.TrackPriceDetailCarTypes));
                var data = Mapper.Map<IEnumerable<TrackPriceDto>>(query);
                var carTypes = await _carTypeUnitOfWork.Repository.GetAllAsync();
                data = data.Select(q =>
                {
                    foreach (var trackpricedetail in q.TrackPriceDetails)
                    {
                        var cartypesids = trackpricedetail.TrackPriceDetailCarTypes.Select(tpdct => tpdct.CarTypeId).ToList();
                        var cartypesdata = carTypes.Where(cars => !cartypesids.Contains(cars.Id));
                        foreach (var cartypeitem in cartypesdata)
                        {
                            trackpricedetail.TrackPriceDetailCarTypes.Add(new TrackPriceDetailCarTypeDto() { CarTypeId = cartypeitem.Id, CarTypePrice = 0 });
                        }
                    }
                    return q;
                });
                
                return ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return result;
            }
        }
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<TrackPriceFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue, include: source => source
                   .Include(t => t.TrackPriceDetails)
                   .ThenInclude(t => t.TrackPriceDetailCarTypes));
                var data = Mapper.Map<IEnumerable<TrackPriceDto>>(query.Item2);
                var carTypes = await _carTypeUnitOfWork.Repository.GetAllAsync();
                data = data.Select(q =>
                {
                    foreach (var trackpricedetail in q.TrackPriceDetails)
                    {
                        var cartypesids = trackpricedetail.TrackPriceDetailCarTypes.Select(tpdct => tpdct.CarTypeId).ToList();
                        var cartypesdata = carTypes.Where(cars => !cartypesids.Contains(cars.Id));
                        foreach (var cartypeitem in cartypesdata)
                        {
                            trackpricedetail.TrackPriceDetailCarTypes.Add(new TrackPriceDetailCarTypeDto() { CarTypeId = cartypeitem.Id, CarTypePrice = 0 });
                        }
                    }
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
