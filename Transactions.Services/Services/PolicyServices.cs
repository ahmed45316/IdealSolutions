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

                var policyData = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.PolicyNumber.ToLower() == model.PolicyNumber.ToLower());
                if (policyData != null)
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "توجد بوليصة بهذا الرقم برجاء المراجعة واعادة الحفظ");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entity = Mapper.Map<Policy>(model);
                entity.CreateDate = DateTime.Now;
                entity.CreateUserId = new Guid(userId);
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
                var policyData = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.PolicyNumber.ToLower() == model.PolicyNumber.ToLower() && q.Id != model.Id);
               
                if (policyData != null)
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "توجد بوليصة بهذا الرقم برجاء المراجعة واعادة الحفظ");
                }
                if (!(policyData.THeadId == null ||policyData.THeadId == 0))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "تم الترحيل");
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
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter,userId), skip: offset, take: limit, filter.OrderByValue);
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
        static Expression<Func<Policy, bool>> PredicateBuilderFunction(PolicyFilter filter, string userId)
        {
            var predicate = PredicateBuilder.New<Policy>(true);
            predicate = predicate.And(b => b.CreateUserId == new Guid(userId));
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
            if (!string.IsNullOrWhiteSpace(filter.PolicyNumber))
            {
                predicate = predicate.And(b => b.PolicyNumber.ToLower().StartsWith(filter.PolicyNumber));
            }
            return predicate;
        }

        public async Task<IResult> GetByCustomerId(Guid customerId)
        {
            var data = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.CustomerId == customerId);
            var dto = Mapper.Map<PolicyDto>(data);
            return ResponseResult.PostResult(result: dto, status: HttpStatusCode.OK, message: "");
        }
    }
}
