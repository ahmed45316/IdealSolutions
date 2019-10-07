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
using Tenets.Common.Core;

using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Services
{
    public class CompanyServices : BaseService<Company, CompanyDto>, ICompanyServices
    {
        private readonly IImageConfig _imageConfig;
        private const string folderName = "Images";
        public CompanyServices(IServiceBaseParameter<Company> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IImageConfig imageConfig) : base(businessBaseParameter, httpContextAccessor)
        {
            _imageConfig = imageConfig;
        }

        public async override Task<IResult> AddAsync(CompanyDto model)
        {
            try
            {
                if (_unitOfWork.Repository.IsExists(q => q.Id != model.Id && (q.NameAr == model.NameAr || q.NameEn == model.NameEn)))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "الاسم موجود من قبل!");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entity = Mapper.Map<Company>(model);
                if (!string.IsNullOrWhiteSpace(entity.Logo))
                {
                    entity.Logo = _imageConfig.SaveImage(entity.Logo, $"Company-{Guid.NewGuid()}", folderName);
                }
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
        public async override Task<IResult> UpdateAsync(CompanyDto model)
        {
            try
            {
                if (_unitOfWork.Repository.IsExists(q => q.Id != model.Id && (q.NameAr == model.NameAr || q.NameEn == model.NameEn)))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "الاسم موجود من قبل!");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entityToUpdate = await _unitOfWork.Repository.GetAsync(model.Id);
                var newEntity = Mapper.Map(model, entityToUpdate);
                if (!string.IsNullOrWhiteSpace(newEntity.Logo))
                {
                    _imageConfig.RemoveImage(newEntity.Logo, folderName);
                    newEntity.Logo = _imageConfig.SaveImage(newEntity.Logo, $"Company-{Guid.NewGuid()}", folderName);
                }
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
                var query = await _unitOfWork.Repository.GetAsync(id);
                var data = Mapper.Map<CompanyDto>(query);
                data.Logo = _imageConfig.ConvertToBase64String(data.Logo, folderName);
                return ResponseResult.PostResult(result: data, status: HttpStatusCode.OK, message: "");
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, result.Message);
                return result;
            }
        }
        public async Task<IDataPagging> GetAllPaggedAsync(BaseParam<MainFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<CompanyDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Company, bool>> PredicateBuilderFunction(MainFilter filter)
        {
            var predicate = PredicateBuilder.New<Company>(true);
            if (!string.IsNullOrWhiteSpace(filter.NameAr))
            {
                predicate = predicate.And(b => b.NameAr.ToLower().Contains(filter.NameAr.ToLower()));
            }
            if (!string.IsNullOrWhiteSpace(filter.NameEn))
            {
                predicate = predicate.And(b => b.NameEn.ToLower().Contains(filter.NameEn.ToLower()));
            }
            return predicate;
        }
        public async Task<IDataPagging> GetDropDownAsync(BaseParam<SearchCriteriaFilter> filter)
        {
            try
            {
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<CompanyDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Company, bool>> PredicateBuilderFunction(SearchCriteriaFilter filter)
        {
            var predicate = PredicateBuilder.New<Company>(true);
            if (!string.IsNullOrWhiteSpace(filter.SearchCriteria))
            {
                predicate = predicate.And(b => b.NameAr.ToLower().Contains(filter.SearchCriteria.ToLower()));
            }
            return predicate;
        }
    }
}
