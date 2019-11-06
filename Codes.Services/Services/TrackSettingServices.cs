﻿using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
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

using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Services
{
    public class TrackSettingServices : BaseService<TrackSetting, TrackSettingDto>, ITrackSettingServices
    {
        public TrackSettingServices(IServiceBaseParameter<TrackSetting> businessBaseParameter, IHttpContextAccessor httpContextAccessor) : base(businessBaseParameter, httpContextAccessor)
        {
        }
        public async override Task<IResult> AddAsync(TrackSettingDto model)
        {
            try
            {
                // if (model.FromTrackId == model.ToTrackId) return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "المسار متشابه برجاء اختر مسار مختلف");
                if (_unitOfWork.Repository.IsExists(q => q.FromTrackId == model.FromTrackId && q.ToTrackId == model.ToTrackId))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "المسار موجود بالفعل");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entity = Mapper.Map<TrackSetting>(model);
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
        public async override Task<IResult> UpdateAsync(TrackSettingDto model)
        {
            try
            {
                //if (model.FromTrackId == model.ToTrackId) return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "المسار متشابه برجاء اختر مسار مختلف");
                if (_unitOfWork.Repository.IsExists(q => q.FromTrackId == model.FromTrackId && q.ToTrackId == model.ToTrackId && q.Id != model.Id))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "المسار موجود بالفعل");
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
        public async override Task<IResult> GetByIdAsync(Guid id)
        {
            try
            {
                var query = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id, include: source => source.Include(t => t.FromTrack).Include(t => t.ToTrack));
                var data = Mapper.Map<TrackSettingDto>(query);
                return ResponseResult.PostResult(result: data, status: HttpStatusCode.OK, message: "");
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, result.Message);
                return result;
            }
        }
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<TrackSettingFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue, include: source => source.Include(t => t.FromTrack).Include(t => t.ToTrack));
                var data = Mapper.Map<IEnumerable<TrackSettingDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<TrackSetting, bool>> PredicateBuilderFunction(TrackSettingFilter filter)
        {
            var predicate = PredicateBuilder.New<TrackSetting>(true);
            if (filter.FromTrackId != null)
            {
                predicate = predicate.And(b => b.FromTrackId == filter.FromTrackId);
            }
            if (filter.ToTrackId != null)
            {
                predicate = predicate.And(b => b.ToTrackId == filter.ToTrackId);
            }
            return predicate;
        }
        public async Task<IDataPagging> GetDropDownAsync(BaseParam<SearchCriteriaFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue,
                                                                         include: source => source.Include(t => t.FromTrack).Include(t => t.ToTrack));
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
        static Expression<Func<TrackSetting, bool>> PredicateBuilderFunction(SearchCriteriaFilter filter)
        {
            var predicate = PredicateBuilder.New<TrackSetting>(true);
            if (!string.IsNullOrWhiteSpace(filter.SearchCriteria))
            {
                predicate = predicate.And(b => (b.FromTrack.NameAr.ToLower() + "-" + b.ToTrack.NameAr.ToLower()).Contains(filter.SearchCriteria.ToLower()));
            }
            return predicate;
        }

    }
}
