using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using AutoMapper;
using BackendCore.Common.Abstraction.UnitOfWork;
using BackendCore.Common.Core;
using BackendCore.Common.Extensions;
using Tasks.Entities.Base;

namespace Tasks.Service.Services.Base
{
    public class BaseService<T, TDto> : IBaseService<T, TDto>
        where T : BaseEntity
        where TDto : IPrimaryKeyField<Guid?>
    {
        protected readonly IUnitOfWork<T> UnitOfWork;
        protected readonly IMapper Mapper;
        protected readonly IResponseResult ResponseResult;
        protected IResult Result;
        protected internal BaseService(IServiceBaseParameter<T> businessBaseParameter)
        {
            UnitOfWork = businessBaseParameter.UnitOfWork;
            ResponseResult = businessBaseParameter.ResponseResult;
            Mapper = businessBaseParameter.Mapper;
        }
        
        public virtual async Task<IResult> GetAllAsync()
        {
            try
            {
                var sortCriteria = new List<SortModel>();
                var sort = new SortModel();
                sortCriteria.Add(sort);
                var query = await UnitOfWork.Repository.GetAllAsync(sortCriteria);
                var data = Mapper.Map<IEnumerable<T>, IEnumerable<TDto>>(query);
                return ResponseResult.PostResult(data, status: HttpStatusCode.OK,
                    message: HttpStatusCode.OK.ToString());
            }
            catch (Exception e)
            {
                Result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                Result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e,
                    message: Result.Message);
                return Result;
            }
        }
        public virtual async Task<IResult> AddAsync(TDto model)
        {
            try
            {
                var entity = Mapper.Map<TDto, T>(model);
                UnitOfWork.Repository.Add(entity);
                var affectedRows = await UnitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    Result = new ResponseResult(result: null, status: HttpStatusCode.Created,
                        message: "Data Inserted Successfully");
                }

                Result.Data = model;
                return Result;
            }
            catch (Exception e)
            {
                Result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                Result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, Result.Message);
                return Result;
            }
        }
        public virtual async Task<IResult> AddListAsync(List<TDto> model)
        {
            try
            {
                var entities = Mapper.Map<List<TDto>, List<T>>(model);
                UnitOfWork.Repository.AddRange(entities);
                var affectedRows = await UnitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    Result = new ResponseResult(result: null, status: HttpStatusCode.Created,
                        message: "Data Inserted Successfully");
                }

                Result.Data = model;
                return Result;
            }
            catch (Exception e)
            {
                Result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                Result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, Result.Message);
                return Result;
            }
        }
        public virtual async Task<IResult> UpdateAsync(TDto model)
        {
            try
            {
                var entityToUpdate = await UnitOfWork.Repository.GetAsync(model.Id);
                var newEntity = Mapper.Map(model, entityToUpdate);
                UnitOfWork.Repository.Update(entityToUpdate, newEntity);
                var affectedRows = await UnitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    Result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted,
                        message: "Data Updated Successfully");
                }

                return Result;
            }
            catch (Exception e)
            {
                Result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                Result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, Result.Message);
                return Result;
            }
        }
        public virtual async Task<IResult> DeleteAsync(Guid id)
        {
            try
            {
                var entityToDelete = await UnitOfWork.Repository.GetAsync(id);
                UnitOfWork.Repository.RemoveLogical(entityToDelete);
                var affectedRows = await UnitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    Result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted,
                        message: "Data Deleted Successfully");
                }

                return Result;
            }
            catch (Exception e)
            {
                Result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                Result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, Result.Message);
                return Result;
            }
        }
        public virtual async Task<IResult> GetByIdAsync(Guid id)
        {
            try
            {
                var query = await UnitOfWork.Repository.GetAsync(id);
                var data = Mapper.Map<T, TDto>(query);
                return ResponseResult.PostResult(result: data, status: HttpStatusCode.OK,
                    message: "Data Retrieved Successfully");
            }
            catch (Exception e)
            {
                Result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                Result = new ResponseResult(null, HttpStatusCode.InternalServerError, e, Result.Message);
                return Result;
            }
        }
    }
}
