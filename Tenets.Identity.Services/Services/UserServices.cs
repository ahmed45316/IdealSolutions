using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using Tenets.Common.Extensions;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.UnitOfWork;
using Tenets.Identity.Services.Interfaces;
using Tenets.Common.Hasher;
using Tenets.Common.ServicesCommon.Identity.Parameters;
using System.Linq.Expressions;
using LinqKit;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Identity.Services.Dto;

namespace Tenets.Identity.Services.Services
{
    public class UserServices : BaseService<User, UserDto>, IUserServices
    {
        const string superAdmin = "c21c91c0-5c2f-45cc-ab6d-1d256538a5ee";
        public UserServices(IServiceBaseParameter<User> businessBaseParameter) : base(businessBaseParameter)
        {
        }

        public async Task<IDataPagging> GetUsers(BaseParam<UserFilter> filter)
        {
            int limit = filter.PageSize;
            int offset = ((--filter.PageNumber) * filter.PageSize);
            var users =  await _unitOfWork.Repository.FindPaggedAsync(PredicateBuilderFunction(filter.Filter), include: source => source.Include(a => a.Role), orderByCriteria: filter.OrderByValue, take: limit, skip: offset, disableTracking: false);
            if (!users.Item2.Any())
            {
                var res = ResponseResult.PostResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
                return new DataPagging(0, 0, 0, res);
            }
            var usersDto = Mapper.Map<IEnumerable<UserDto>>(users.Item2);
            var repoResult = ResponseResult.PostResult(usersDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            return new DataPagging(++filter.PageNumber, filter.PageSize, users.Item1, repoResult);
        }
        static Expression<Func<User, bool>> PredicateBuilderFunction(UserFilter parameters)
        {
            var predicate = PredicateBuilder.New<User>(true);
            predicate = predicate.And(u => !u.IsDeleted&&u.Id != new Guid(AdmistratorId));
            if (!string.IsNullOrWhiteSpace(parameters.UserName))
            {
                predicate = predicate.And(b => b.UserName.ToLower().Contains(parameters.UserName.ToLower()));
            }
            return predicate;
        }
        public async override Task<IResult> AddAsync(UserDto model)
        {
            try
            {
                if (await IsUsernameExists(model.UserName))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "اسم المستخدم موجود بالفعل");
                }
                var entity = Mapper.Map<User>(model);
                entity.Password = CreptoHasher.HashPassword(entity.Password);
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
        public async override Task<IResult> UpdateAsync(UserDto model)
        {
            try
            {
                if (await IsUsernameExists(model.UserName,model.Id))
                {
                    return new ResponseResult(result: null, status: HttpStatusCode.BadRequest, message: "اسم المستخدم موجود بالفعل");
                }
                var entityToUpdate = await _unitOfWork.Repository.GetAsync(model.Id);
                model.Password = CreptoHasher.HashPassword(model.Password);
                var newEntity = Mapper.Map(model, entityToUpdate);
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
        public async Task<bool> IsSuperAdmin(Guid userId)
        {
            var data = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == userId);
            return data.RoleId == new Guid(superAdmin);
        }
        private async Task<bool> IsUsernameExists(string name, Guid? id =null)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.UserName == name && q.Id != id && !q.IsDeleted);
            return res != null;
        }
        
    }
}
