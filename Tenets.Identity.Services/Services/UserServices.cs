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
using Tenets.Common.OptionModel;
using Tenets.Common.ServicesCommon.Identity.Interface;
using Tenets.Common.ServicesCommon.Identity.Parameters;

namespace Tenets.Identity.Services.Services
{
    public class UserServices : BaseService<User, IUserDto>, IUserServices
    {
        private readonly IUnitOfWork<Role> _roleUnitOfWork;
        private readonly IUnitOfWork<UsersRole> _usersRoleUnitOfWork;
        private readonly IImageConfig _imageConfig;

        public UserServices(IServiceBaseParameter<User> businessBaseParameter, IUnitOfWork<Role> roleUnitOfWork, IUnitOfWork<UsersRole> usersRoleUnitOfWork, IImageConfig imageConfig) : base(businessBaseParameter)
        {
            _roleUnitOfWork = roleUnitOfWork;
            _usersRoleUnitOfWork = usersRoleUnitOfWork;
            _imageConfig = imageConfig;
        }

        public async Task<IDataPagging> GetUsers(GetAllUserParameters parameters)
        {
            var users = !string.IsNullOrEmpty(parameters.UserName) ? await _unitOfWork.Repository.FindAsync(q => !q.IsDeleted && q.Id != new Guid(AdmistratorId)&& q.UserName.Contains(parameters.UserName), include: source => source.Include(a => a.UsersRole).ThenInclude(b => b.Role), orderByCriteria: parameters.OrderByValue, take: parameters.PageSize, skip: parameters.PageNumber, disableTracking: false) : await _unitOfWork.Repository.FindAsync(q => !q.IsDeleted && q.Id != new Guid(AdmistratorId), include: source => source.Include(a => a.UsersRole).ThenInclude(b => b.Role), orderByCriteria: parameters.OrderByValue, take: parameters.PageSize, skip: parameters.PageNumber, disableTracking: false);
            if (!users.Any())
            {
                var res = ResponseResult.PostResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
                return new DataPagging(0, 0, 0, res);
            }
            var usersDto = Mapper.Map<IEnumerable<IUserDto>>(users);
            foreach (var item in usersDto)
            {
                var role = users.Where(q => q.Id == item.Id).SelectMany(p => p.UsersRole.Select(r => r.Role.Name)).ToList();
                item.Roles = (role == null || role.Count == 0) ? null : String.Join(",", role.ToArray());
            }
            var repoResult = ResponseResult.PostResult(usersDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            return new DataPagging(parameters.PageNumber, parameters.PageSize, users.Count(), repoResult);
        }
        public override async Task<IResult> GetByIdAsync(Guid id)
        {
            var user = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id, disableTracking: false);
            if (user == null) return ResponseResult.PostResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var userDto = Mapper.Map<User, IUserDto>(user);
            if (!string.IsNullOrEmpty(userDto.ImgPath))
            {
                int index = userDto.ImgPath.IndexOf(".") + 1;
                var extension = index > 0 ? userDto.ImgPath.Substring(index) : "";
                userDto.ImgPath = _imageConfig.ConvertToBase64String(userDto.ImgPath, extension, "PersonalImage");
            }
            return ResponseResult.PostResult(userDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        public override async Task<IResult> AddAsync(IUserDto model)
        {
            if (model == null) return ResponseResult.PostResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var isExist = await _unitOfWork.Repository.FirstOrDefaultAsync(q => (q.UserName == model.UserName || q.Email == model.Email || (q.PhoneNumber == model.PhoneNumber && (model.PhoneNumber != "" && model.PhoneNumber != null))) && !q.IsDeleted) != null;
            if (isExist) return ResponseResult.PostResult(status: HttpStatusCode.NotAcceptable, message: HttpStatusCode.NotAcceptable.ToString());
            model.SecurityStamp = Guid.NewGuid().ToString();
            model.PasswordHash = CreptoHasher.HashPassword(model.PasswordHash);
            var user = Mapper.Map<IUserDto, User>(model);
            var userAdded = _unitOfWork.Repository.Add(user);
            await _unitOfWork.SaveChanges();
            return ResponseResult.PostResult(model, status: HttpStatusCode.Created, message: HttpStatusCode.Created.ToString());
        }
        public override async Task<IResult> UpdateAsync(IUserDto model)
        {
            if (model == null) return ResponseResult.PostResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var isExist = await _unitOfWork.Repository.FirstOrDefaultAsync(q => (q.UserName == model.UserName || q.Email == model.Email || (q.PhoneNumber == model.PhoneNumber && (model.PhoneNumber != "" +
            "" && model.PhoneNumber != null))) && q.Id != model.Id && !q.IsDeleted) != null;
            if (isExist) return ResponseResult.PostResult(status: HttpStatusCode.NotAcceptable, message: HttpStatusCode.NotAcceptable.ToString());
            var original = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == model.Id, disableTracking: false);
            model.SecurityStamp = Guid.NewGuid().ToString();
            model.PasswordHash = CreptoHasher.HashPassword(model.PasswordHash);
            if (!string.IsNullOrEmpty(model.ImgPath))
            {
                model.ImgPath = _imageConfig.SaveImage(model.ImgPath, $"User-{Guid.NewGuid().ToString()}", model.ImgExtinsion, "PersonalImage");
                if (!string.IsNullOrEmpty(original.ImgPath)) _imageConfig.RemoveImage(original.ImgPath, "PersonalImage");
            }
            else
            {
                model.ImgPath = original.ImgPath;
            }
            var user = Mapper.Map<IUserDto, User>(model);
            _unitOfWork.Repository.Update(original, user);
            await _unitOfWork.SaveChanges();
            return ResponseResult.PostResult(model, status: HttpStatusCode.Accepted, message: HttpStatusCode.Accepted.ToString());
        }
        public override async Task<IResult> DeleteAsync(Guid id)
        {
            if (id == null) return ResponseResult.PostResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var user = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id);
            var original = user;
            user.IsDeleted = true;
            _unitOfWork.Repository.Update(original, user);
            await _unitOfWork.SaveChanges();
            return ResponseResult.PostResult(true, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        
        public async Task<IResult> IsUsernameExists(string name, Guid? id)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.UserName == name && q.Id != id && !q.IsDeleted);
            return ResponseResult.PostResult(res != null, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        public async Task<IResult> IsEmailExists(string email, Guid? id)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Email == email && q.Id != id && !q.IsDeleted);
            return ResponseResult.PostResult(res != null, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        public async Task<IResult> IsPhoneExists(string phone, Guid? id)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.PhoneNumber == phone && q.Id != id && !q.IsDeleted);
            return ResponseResult.PostResult(res != null, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        //=======================================
        public async Task<Select2PagedResult> GetUsersSelect2(string searchTerm, int pageSize, int pageNumber)
        {
            var users = !string.IsNullOrEmpty(searchTerm) ? await _unitOfWork.Repository.FindAsync(n => !n.IsDeleted && n.Id != new Guid(AdmistratorId) && n.UserName.ToLower().Contains(searchTerm.ToLower()), disableTracking: false) : await _unitOfWork.Repository.FindAsync(q => !q.IsDeleted && q.Id != new Guid(AdmistratorId), disableTracking: false);
            var result = users.OrderBy(q => q.Id).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(q => new Select2OptionModel { id = q.Id.ToString(), text = q.UserName }).ToList();
            var select2pagedResult = new Select2PagedResult();
            select2pagedResult.Total = users.Count();
            select2pagedResult.Results = result;
            return select2pagedResult;
        }
        public async Task<IEnumerable<Select2OptionModel>> GetUserAssignedSelect2(Guid id)
        {
            var role = await _roleUnitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id, include: source => source.Include(a => a.UsersRole).Include(b => b.UsersRole), disableTracking: false);
            var userIdList = role.UsersRole.Select(q => q.UserId).ToList();
            var userassignQuery = await _unitOfWork.Repository.FindAsync(q => userIdList.Contains(q.Id) && !q.IsDeleted);
            var userassign = userassignQuery.Select(q => new Select2OptionModel { id = q.Id.ToString(), text = q.UserName }).ToList();
            return userassign;
        }
        public async Task<IResult> SaveUserAssigned(AssignUserOnRoleParameters parameters)
        {
            var role = await _roleUnitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == parameters.RoleId, include: source => source.Include(a => a.UsersRole), disableTracking: false);
            if (parameters.AssignedUser != null)
            {
                foreach (var item in parameters.AssignedUser)
                {
                    var isExist = await _usersRoleUnitOfWork.Repository.FirstOrDefaultAsync(q => q.UserId == item && q.RoleId == parameters.RoleId) != null;
                    if (!isExist)
                    {
                        var userRole = new UsersRole() { UserId = item, RoleId = parameters.RoleId };
                        _usersRoleUnitOfWork.Repository.Add(userRole);
                    }
                }
            }

            var userRemove = parameters.AssignedUser is null ? role.UsersRole : role.UsersRole.Where(q => !parameters.AssignedUser.Contains(q.UserId));
            _usersRoleUnitOfWork.Repository.RemoveRange(userRemove);
            await _usersRoleUnitOfWork.SaveChanges();
            return ResponseResult.PostResult(true, status: HttpStatusCode.Created, message: HttpStatusCode.Created.ToString());
        }
    }
}
