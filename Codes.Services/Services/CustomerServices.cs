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
using System.Threading.Tasks;
using RestSharp;
using Tenets.Common.Core;
using Tenets.Common.RestSharp;

using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Services
{
    public class CustomerServices : BaseService<Customer, CustomerDto>, ICustomerServices
    {
        private readonly IRestSharpContainer _restSharpContainer;
        public CustomerServices(IServiceBaseParameter<Customer> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IRestSharpContainer restSharpContainer) : base(businessBaseParameter, httpContextAccessor)
        {
            _restSharpContainer = restSharpContainer;
        }

        public async override Task<IResult> AddAsync(CustomerDto model)
        {
            try
            {
                if (_unitOfWork.Repository.IsExists(q => q.Id != model.Id && (q.NameAr == model.NameAr || q.NameEn == model.NameEn || q.CustomerCode == model.CustomerCode)))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "الاسم او الكود موجود من قبل!");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entity = Mapper.Map<Customer>(model);
                entity.CreateDate = DateTime.Now;
                entity.CreateUserId = new Guid(userId);
                var dataSaved = _unitOfWork.Repository.Add(entity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = new ResponseResult(result: dataSaved, status: HttpStatusCode.Created, message: "تم الحفظ بنجاح");
                    await _restSharpContainer.SendRequest("T/Communication/Add", RestSharp.Method.POST, dataSaved);

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
        public async override Task<IResult> UpdateAsync(CustomerDto model)
        {
            try
            {
                if (_unitOfWork.Repository.IsExists(q => q.Id != model.Id && (q.NameAr == model.NameAr || q.NameEn == model.NameEn || q.CustomerCode == model.CustomerCode)))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "الاسم او الكود موجود من قبل!");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entityToUpdate = await _unitOfWork.Repository.GetAsync(model.Id);
                var newEntity = Mapper.Map(model, entityToUpdate);
                newEntity.CreateUserId = entityToUpdate.CreateUserId;
                newEntity.CreateDate = entityToUpdate.CreateDate;
                newEntity.ModifyDate = DateTime.Now;
                newEntity.ModifyUserId = new Guid(userId);
                _unitOfWork.Repository.Update(entityToUpdate, newEntity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted, message: "تم التعديل بنجاح");
                    await _restSharpContainer.SendRequest("T/Communication/Update", RestSharp.Method.PUT, model);
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
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<CustomerFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<CustomerDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Customer, bool>> PredicateBuilderFunction(CustomerFilter filter)
        {
            var predicate = PredicateBuilder.New<Customer>(true);
            if (filter.RepresentativeId != null)
            {
                predicate = predicate.And(b => b.RepresentativeId == filter.RepresentativeId);
            }
            if (!string.IsNullOrWhiteSpace(filter.NameAr))
            {
                predicate = predicate.And(b => b.NameAr.ToLower().Contains(filter.NameAr.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(filter.NameEn))
            {
                predicate = predicate.And(b => b.NameEn.ToLower().Contains(filter.NameEn.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(filter.Email))
            {
                predicate = predicate.And(b => b.Email.ToLower() == filter.Email.ToLower());
            }
            return predicate;
        }
        public async Task<IDataPagging> GetDropDownAsync(BaseParam<SearchCriteriaFilter> filter)
        {
            try
            {
                var representativeId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "RepresentativeId").Value;
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter, representativeId), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<DropdownDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Customer, bool>> PredicateBuilderFunction(SearchCriteriaFilter filter, string representativeId)
        {
            var predicate = PredicateBuilder.New<Customer>(true);
            if (!string.IsNullOrWhiteSpace(filter.SearchCriteria))
            {
                predicate = predicate.And(b => b.NameAr.ToLower().Contains(filter.SearchCriteria.ToLower()));
            }

            if (!string.IsNullOrWhiteSpace(representativeId))
            {
                predicate = predicate.And(b => b.RepresentativeId == new Guid(representativeId));
            }
            return predicate;
        }
        public async Task<IResult> GetList(List<Guid> ids)
        {
            var data = await _unitOfWork.Repository.FindAsync(q => ids.Contains(q.Id));
            return new ResponseResult(result: data, status: HttpStatusCode.OK, message: "");
        }
        public async override Task<IResult> DeleteAsync(Guid id)
        {
            try
            {
                var serviceResult = await _restSharpContainer.SendRequest<Result>($"T/Policy/GetByCustomerId/{id}", RestSharp.Method.GET);
                if (serviceResult.Data != null)
                {
                    return ResponseResult.PostResult(result: true, status: HttpStatusCode.BadRequest, message: "لا تستطيع الحذف");
                }
                var entityToDelete = await _unitOfWork.Repository.GetAsync(id);
                _unitOfWork.Repository.Remove(entityToDelete);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted, message: "تم الحذف بنجاح");
                    await _restSharpContainer.SendRequest($"T/Communication/Remove/{id}", Method.DELETE);

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
    }
}
