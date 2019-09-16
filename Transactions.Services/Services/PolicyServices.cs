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
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Interface;
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
        private readonly IUnitOfWork<PolicyDetail> _policyDetailUnitOfWork;
        public PolicyServices(IServiceBaseParameter<Policy> businessBaseParameter, IHttpContextAccessor httpContextAccessor, IUnitOfWork<PolicyDetail> policyDetailUnitOfWork) : base(businessBaseParameter, httpContextAccessor)
        {
            _policyDetailUnitOfWork = policyDetailUnitOfWork;
        }
        public async override Task<IResult> AddAsync(PolicyDto model)
        {
            try
            {
                var policyNumbers = model?.PolicyDetails.Select(q => q.PolicyNumber).ToList();
                if (policyNumbers.Count != policyNumbers.Distinct().Count())
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.Created, message: "توجد ارقام فواتير مكررة");
                }
                var isExist = await _policyDetailUnitOfWork.Repository.FirstOrDefaultAsync(q => policyNumbers.Contains(q.PolicyNumber));

                if (isExist != null)
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.Created, message: "توجد فواتير بهذة الارقام موجودة في قاعدة البيانات برجاء مراجعة ارقام الفواتير واعادة الحفظ");
                }
                var userId = _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value;
                var entity = Mapper.Map<Policy>(model);
                entity.CreateDate = DateTime.Now;
                entity.CreateUserId = new Guid(userId);
                _unitOfWork.Repository.Add(entity);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = new ResponseResult(result: null, status: HttpStatusCode.Created, message: "Data Inserted Successfully");
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
                await DeleteAsync(model.Id ?? new Guid(""));
                await base.AddAsync(model);
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
                var entityToDelete = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id, include: source => source.Include(p => p.PolicyDetails));
                _unitOfWork.Repository.Remove(entityToDelete);
                int affectedRows = await _unitOfWork.SaveChanges();
                if (affectedRows > 0)
                {
                    result = ResponseResult.PostResult(result: true, status: HttpStatusCode.Accepted, message: "Data Removed Successfully");
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
                var query = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id, include: source => source.Include(p => p.PolicyDetails));
                var data = Mapper.Map<PolicyDto>(query);
                return ResponseResult.PostResult(result: data, status: HttpStatusCode.OK, message: "");
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
                int limit = filter.PageSize;
                int offset = ((--filter.PageNumber) * filter.PageSize);
                var query = await _unitOfWork.Repository.FindPaggedAsync(predicate: PredicateBuilderFunction(filter.Filter), skip: offset, take: limit, filter.OrderByValue);
                var data = Mapper.Map<IEnumerable<PolicyDto>>(query.Item2);
                return new DataPagging(++filter.PageNumber, filter.PageSize, query.Item1, ResponseResult.PostResult(data, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()));
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return new DataPagging(0, 0, 0, result);
            }
        }
        static Expression<Func<Policy, bool>> PredicateBuilderFunction(PolicyFilter filter)
        {
            var predicate = PredicateBuilder.New<Policy>(true);
            if (filter.PolicyDate != null)
            {
                predicate = predicate.And(b => b.PolicyDateTime == filter.PolicyDate);
            }

            return predicate;
        }
    }
}
