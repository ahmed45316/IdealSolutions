using AutoMapper;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Identity.Services.UnitOfWork;

namespace Tenets.Identity.Services.Core
{

    public class BaseService<T,TDto> : IBaseService<T,TDto>
        where T : class
        where TDto : IPrimaryKeyField<Guid>
    {
        protected readonly IUnitOfWork<T> _unitOfWork;
        protected readonly IMapper Mapper;
        protected readonly IResponseResult ResponseResult;
        protected TDto currentModel { get; set; }
        protected const string AdmistratorId = "c21c91c0-5c2f-45cc-ab6d-1d256538a4ee";
        protected const string AdmistratorRoleId = "c21c91c0-5c2f-45cc-ab6d-1d256538a5ee";
        protected IResponseResult result;
        protected internal BaseService(IServiceBaseParameter<T> businessBaseParameter)
        {
            _unitOfWork = businessBaseParameter.UnitOfWork;
            ResponseResult = businessBaseParameter.ResponseResult;
            Mapper = businessBaseParameter.Mapper;
        }
        public virtual async Task<IResponseResult> GetAllAsync(bool disableTracking=false)
        {
            try
            {
                var query = await _unitOfWork.Repository.GetAllAsync(disableTracking: disableTracking);
                var data = Mapper.Map<IEnumerable<T>, IEnumerable<TDto>>(query);
                return ResponseResult.GetRepositoryActionResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError,exception: e, message:result.Message);
                return result;
            }
        }
        public virtual async Task<IResponseResult> AddAsync(TDto model)
        {
            try
            {
                T entity = Mapper.Map<TDto, T>(model);
                _unitOfWork.Repository.Add(entity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = new ResponseResult(result: null, status: HttpStatusCode.Created, message:"Data Inserted Successfully");
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
        public virtual async Task<IResponseResult> UpdateAsync(TDto model)
        {
            try
            {
                T entityToUpdate = await _unitOfWork.Repository.GetAsync(model.Id);
                var newEntity = Mapper.Map(model, entityToUpdate);
                _unitOfWork.Repository.Update(entityToUpdate,newEntity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.GetRepositoryActionResult(result: true, status: HttpStatusCode.Accepted, message: "Data Updated Successfully");
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
        public virtual async Task<IResponseResult> DeleteAsync(Guid id)
        {
            try
            {
                var entityToDelete = await _unitOfWork.Repository.GetAsync(id);
                _unitOfWork.Repository.Remove(entityToDelete);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.GetRepositoryActionResult(result: true, status: HttpStatusCode.Accepted, message: "Data Updated Successfully");
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
        public virtual async Task<IResponseResult> GetByIdAsync(Guid id)
        {
            try
            {
                T query = await _unitOfWork.Repository.GetAsync(id);
                var data = Mapper.Map<T, TDto>(query);             
                return ResponseResult.GetRepositoryActionResult(result: data, status: HttpStatusCode.OK, message: "Data Updated Successfully");
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
