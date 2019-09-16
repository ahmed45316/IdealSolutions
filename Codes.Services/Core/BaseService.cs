using AutoMapper;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Codes.Services.UnitOfWork;
using Microsoft.AspNetCore.Http;

namespace Codes.Services.Core
{

    public class BaseService<T,TDto> : IBaseService<T,TDto>
        where T : class, ICommonProperty
        where TDto : IPrimaryKeyField<Guid?>
    {
        protected readonly IUnitOfWork<T> _unitOfWork;
        protected readonly IMapper Mapper;
        protected readonly IResponseResult ResponseResult;
        protected readonly IHttpContextAccessor _httpContextAccessor;
        protected TDto currentModel { get; set; }
        protected IResult result;
        protected internal BaseService(IServiceBaseParameter<T> businessBaseParameter, IHttpContextAccessor httpContextAccessor)
        {
            _unitOfWork = businessBaseParameter.UnitOfWork;
            ResponseResult = businessBaseParameter.ResponseResult;
            Mapper = businessBaseParameter.Mapper;
            _httpContextAccessor = httpContextAccessor;
        }
        public virtual async Task<IResult> GetAllAsync(bool disableTracking=false)
        {
            try
            {
                var query = await _unitOfWork.Repository.GetAllAsync(disableTracking: disableTracking);
                var data = Mapper.Map<IEnumerable<TDto>>(query);
                return ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError,exception: e, message:result.Message);
                return result;
            }
        }
        public virtual async Task<IResult> AddAsync(TDto model)
        {
            try
            {
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                T entity = Mapper.Map<T>(model);
                entity.CreateDate = DateTime.Now;
                entity.CreateUserId =new Guid(userId);
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
        public virtual async Task<IResult> UpdateAsync(TDto model)
        {
            try
            {
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                T entityToUpdate = await _unitOfWork.Repository.GetAsync(model.Id);
                var newEntity = Mapper.Map(model, entityToUpdate);
                newEntity.CreateUserId = entityToUpdate.CreateUserId;
                newEntity.CreateDate = entityToUpdate.CreateDate;
                newEntity.ModifyDate = DateTime.Now;
                newEntity.ModifyUserId = new Guid(userId);
                _unitOfWork.Repository.Update(entityToUpdate,newEntity);
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
        public virtual async Task<IResult> DeleteAsync(Guid id)
        {
            try
            {
                var entityToDelete = await _unitOfWork.Repository.GetAsync(id);
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
        public virtual async Task<IResult> GetByIdAsync(Guid id)
        {
            try
            {
                T query = await _unitOfWork.Repository.GetAsync(id);
                var data = Mapper.Map<TDto>(query);             
                return ResponseResult.PostResult(result: data, status: HttpStatusCode.OK, message: "");
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
