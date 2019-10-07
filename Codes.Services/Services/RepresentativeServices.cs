using Codes.Entities.Entities;
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
using System.Threading.Tasks;
using Tenets.Common.Core;

using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Services
{
    public class RepresentativeServices : BaseService<Representative, RepresentativeDto>, IRepresentativeServices
    {
        public RepresentativeServices(IServiceBaseParameter<Representative> businessBaseParameter, IHttpContextAccessor httpContextAccessor) : base(businessBaseParameter, httpContextAccessor)
        {
        }
        public async override Task<IResult> AddAsync(RepresentativeDto model)
        {
            try
            {
                if (_unitOfWork.Repository.IsExists(q => q.Id != model.Id && (q.NameAr == model.NameAr || q.NameEn == model.NameEn || q.RepresentativeCode == model.RepresentativeCode)))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "الاسم او الكود موجود من قبل!");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entity = Mapper.Map<Representative>(model);
                entity.CreateDate = DateTime.Now;
                entity.CreateUserId = new Guid(userId);
                var dataSaved = _unitOfWork.Repository.Add(entity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = new ResponseResult(result: dataSaved, status: HttpStatusCode.Created, message: "تم الحفظ بنجاح");
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
        public async override Task<IResult> UpdateAsync(RepresentativeDto model)
        {
            try
            {
                if (_unitOfWork.Repository.IsExists(q => q.Id != model.Id && (q.NameAr == model.NameAr || q.NameEn == model.NameEn || q.RepresentativeCode == model.RepresentativeCode)))
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
                var entityToDelete = await _unitOfWork.Repository.FirstOrDefaultAsync(q=>q.Id==id,include:source=>source.Include(i=>i.Customers));
                if (entityToDelete.Customers.Any())
                {
                    return ResponseResult.PostResult(result: true, status: HttpStatusCode.BadRequest, message: "لا تستطيع حذف مندوب مربوط بعملاء بالفعل");
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
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<RepresentativeFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<RepresentativeDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Representative, bool>> PredicateBuilderFunction(RepresentativeFilter filter)
        {
            var predicate = PredicateBuilder.New<Representative>(true);
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
    }
}
