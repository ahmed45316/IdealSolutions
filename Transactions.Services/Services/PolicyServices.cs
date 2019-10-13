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
using Tenets.Common.RestSharp;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.Entities.Entites;
using Transactions.Services.Core;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;
using Transactions.Services.ReportsDto;
using Transactions.Services.UnitOfWork;


namespace Transactions.Services.Services
{
    public class PolicyServices : BaseService<Policy, PolicyDto>, IPolicyServices
    {
        private readonly IRestSharpContainer _restSharpContainer;
        public PolicyServices(IServiceBaseParameter<Policy> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IRestSharpContainer restSharpContainer) : base(businessBaseParameter, httpContextAccessor)
        {
            _restSharpContainer = restSharpContainer;
        }
        public async override Task<IResult> AddAsync(PolicyDto model)
        {
            try
            {

                var hasManafest = _unitOfWork.Repository.IsExists(q => q.ManafestNumber!=null && q.ManafestNumber.ToLower() == model.ManafestNumber.ToLower());
                if (hasManafest)
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "رقم منفست مكرر");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var branchId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "BranchId").Value;
                var entity = Mapper.Map<Policy>(model);
                if (entity.IsRentedCar && entity.DriverId == null)
                {

                    var driverObject = new DriverDto() { NameEn = entity.DriverName, NameAr = entity.DriverName, Phone = entity.DriverPhone, Mobile = entity.DriverPhone, NationalityId = entity.NationalityId , IdentifacationNumber = model.IdentifacationNumber, IsOutSource = true };
                    var serviceResult = await _restSharpContainer.SendRequest<Result>("L/Driver/Add", RestSharp.Method.POST, driverObject);
                    if(serviceResult.Data is null) return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: serviceResult.Message);
                    var jsonString = JsonConvert.SerializeObject(serviceResult.Data);
                    var driverResult = JsonConvert.DeserializeObject<DriverDto>(jsonString);
                    entity.DriverId = driverResult.Id;
                }
                entity.CreateDate = DateTime.Now;
                entity.CreateUserId = new Guid(userId);
                entity.BranchId = new Guid(branchId);
                //For Some Times Only 
                var policies = await _unitOfWork.Repository.GetAllAsync();
                entity.PolicyNumber = policies.Any() ? (1000 + policies.Count()) : 1000;
                //end
                _unitOfWork.Repository.Add(entity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = new ResponseResult(result: null, status: HttpStatusCode.Created, message: "تم الحفظ بنجاح");
                }

                result.Data = model;
                return result;
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, result.Message);
                return result;
            }
        }
        public async override Task<IResult> UpdateAsync(PolicyDto model)
        {
            try
            {
                var hasManafest = _unitOfWork.Repository.IsExists(q => q.ManafestNumber != null && q.ManafestNumber.ToLower() == model.ManafestNumber.ToLower() && q.Id != model.Id);
                if (hasManafest)
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "رقم منفست مكرر");
                }

                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var branchId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "BranchId").Value;
                var entityToUpdate = await _unitOfWork.Repository.GetAsync(model.Id);
                if (!(entityToUpdate.THeadId == null || entityToUpdate.THeadId == 0))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "تم الترحيل");
                }
                if (model.IsRentedCar && model.DriverId != null)
                {

                    var driverObject = new DriverDto() { Id = model.DriverId, NameEn = model.DriverName, NameAr = model.DriverName, Phone = model.DriverPhone, Mobile = model.DriverPhone, NationalityId = model.NationalityId,IdentifacationNumber = model.IdentifacationNumber, IsOutSource = true };
                   var serviceResult= await _restSharpContainer.SendRequest<Result>("L/Driver/Update", RestSharp.Method.PUT, driverObject);
                    if (serviceResult.Data is null) return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: serviceResult.Message);
                }
                var newEntity = Mapper.Map(model, entityToUpdate);
                newEntity.CreateUserId = entityToUpdate.CreateUserId;
                newEntity.CreateDate = entityToUpdate.CreateDate;
                newEntity.ModifyDate = DateTime.Now;
                newEntity.ModifyUserId = new Guid(userId);
                newEntity.BranchId = new Guid(branchId);
                _unitOfWork.Repository.Update(entityToUpdate, newEntity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted, message: "تم التعديل بنجاح");
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
        public async override Task<IResult> DeleteAsync(Guid id)
        {
            try
            {
                var entityToDelete = await _unitOfWork.Repository.GetAsync(id);
                if (!(entityToDelete.THeadId == null || entityToDelete.THeadId == 0))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "تم الترحيل");
                }
                _unitOfWork.Repository.Remove(entityToDelete);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted, message: "تم الحذف بنجاح");
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
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<PolicyFilter> filter)
        {
            try
            {

                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);

                var serviceResultForIsSuper = await _restSharpContainer.SendRequest<bool>($"I/User/IsSuperAdmin/{userId}", RestSharp.Method.GET);

                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter, userId, serviceResultForIsSuper), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<PolicyDto>>(query.Item2);
                //==============================================================
                var customerIds = data.Select(q => q.CustomerId).ToList();
                var serviceResult = await _restSharpContainer.SendRequest<Result>("L/Customer/GetList", RestSharp.Method.POST, customerIds);
                if (serviceResult == null && serviceResult.Data == null)
                {
                    return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
                }
                var jsonString = JsonConvert.SerializeObject(serviceResult.Data);
                var customersResult = JsonConvert.DeserializeObject<List<CustomerDto>>(jsonString);

                data = data.Select(q =>
                {
                    q.CustomerNameAr = customersResult.FirstOrDefault(c => c.Id == q.CustomerId).NameAr;
                    return q;
                });
                //==============================================================
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Policy, bool>> PredicateBuilderFunction(PolicyFilter filter, string userId, bool isSuperAdmin)
        {
            var predicate = PredicateBuilder.New<Policy>(true);
            //IsSuperAdmin
            if (!isSuperAdmin)
            {
                predicate = predicate.And(b => b.CreateUserId == new Guid(userId));
            }
            if (filter.PolicyDatetime != null)
            {
                predicate = predicate.And(b => b.PolicyDatetime.Value.Date == filter.PolicyDatetime.Value.Date);
            }

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
            if (filter.PolicyNumber != null)
            {
                predicate = predicate.And(b => b.PolicyNumber == filter.PolicyNumber);
            }
            return predicate;
        }

        public async Task<IResult> GetByCustomerId(Guid customerId)
        {
            var data = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.CustomerId == customerId);
            var dto = Mapper.Map<PolicyDto>(data);
            return ResponseResult.PostResult(result: dto, status: HttpStatusCode.OK, message: "");
        }

        public async Task<PolicyViewModel> GetPolicyForReport(Guid id)
        {
            var data = await _unitOfWork.Repository.GetAsync(id);
            var policy = Mapper.Map<PolicyViewModel>(data);
                //Customer
                var customerResult = await _restSharpContainer.SendRequest<Result>($"L/Customer/GetForReport/{data.CustomerId}", RestSharp.Method.GET);
                var customer = JsonConvert.DeserializeObject<CustomerDto>(JsonConvert.SerializeObject(customerResult.Data));
                policy.CustomerNameAr = customer.NameAr;
                //Car Type
                var carTypeResult = await _restSharpContainer.SendRequest<Result>($"L/CarType/GetForReport/{data.CarTypeId}", RestSharp.Method.GET);
                var carType = JsonConvert.DeserializeObject<CustomerDto>(JsonConvert.SerializeObject(carTypeResult.Data));
                policy.CarTypeName = carType.NameAr;
                //Track
                var TrackResult = await _restSharpContainer.SendRequest<Result>($"L/TrackSetting/GetForReport/{data.TrackSettingId}", RestSharp.Method.GET);
                var Track = JsonConvert.DeserializeObject<CustomerDto>(JsonConvert.SerializeObject(TrackResult.Data));
                policy.TrackName = Track.NameAr;
                //Driver
                if (data.DriverId != null)
                {
                    var driverResult = await _restSharpContainer.SendRequest<Result>($"L/Driver/GetForReport/{data.DriverId}", RestSharp.Method.GET);
                    var driver = JsonConvert.DeserializeObject<CustomerDto>(JsonConvert.SerializeObject(driverResult.Data));
                    policy.DriverName = driver.NameAr;
                }

            return policy;
        }
    }
}
