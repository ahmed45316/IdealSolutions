using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using Tenets.Common.Extensions;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Identity.Dto;
using Tenets.Common.Identity.Interface;
using Tenets.Common.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.UnitOfWork;
using Tenets.Identity.Services.Interfaces;
using Tenets.Common.Hasher;
using Tenets.Common.OptionModel;

namespace Tenets.Identity.Services.Services
{
    public class UserServices : BaseService<User, IUserDto, UserDto>, IUserServices
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
            var users = await _unitOfWork.Repository.FindAsync(q => !q.IsDeleted && q.Id != new Guid(AdmistratorId), include: source => source.Include(a => a.UsersRole).ThenInclude(b => b.Role), disableTracking: false);
            users = !string.IsNullOrEmpty(parameters.UserName) ? users.Where(q => q.UserName.Contains(parameters.UserName)) : users;
            //users = !string.IsNullOrEmpty(parameters.Name) ? users.Where(q => q.Id.Equals(parameters.Name)) : users;
            var usesrPagging = users.AsQueryable().OrderBy(parameters.OrderByValue).Skip(parameters.PageNumber).Take(parameters.PageSize).ToList();

            if (!usesrPagging.Any())
            {
                var res = ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
                return new DataPagging(0, 0, 0, res);
            }

            var usersDto = Mapper.Map<IEnumerable<User>, IEnumerable<IUserDto>>(usesrPagging);
            foreach (var item in usersDto)
            {
                //var EntityInfo = _lookupUnitOfWork.Repo.FirstOrDefault(n => n.YES_NO == 1 && n.LOOKUP_TYPE == "EntityInfo" && n.LOOKUP_CODE == item.EntityIdInfo);
                //item.EntityIdInfoName = EntityInfo.ARABIC_VALUE;
                var role = users.Where(q => q.Id == item.Id).SelectMany(p => p.UsersRole.Select(r => r.Role.Name)).ToList();
                item.Roles = (role == null || role.Count == 0) ? null : String.Join(",", role.ToArray());
            }
            var repoResult = ResponseResult.GetRepositoryActionResult(usersDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            return new DataPagging(parameters.PageNumber, parameters.PageSize, users.Count(), repoResult);
        }
        public async Task<IResponseResult> GetUser(Guid Id)
        {
            var user = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == Id, disableTracking: false);
            if (user == null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var userDto = Mapper.Map<User, IUserDto>(user);
            if (!string.IsNullOrEmpty(userDto.ImgPath))
            {
                int index = userDto.ImgPath.IndexOf(".") + 1;
                var extension = index > 0 ? userDto.ImgPath.Substring(index) : "";
                userDto.ImgPath = _imageConfig.ConvertToBase64String(userDto.ImgPath, extension, "PersonalImage");
            }
            return ResponseResult.GetRepositoryActionResult(userDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        public async Task<IResponseResult> AddUser(IUserDto userDto)
        {
            if (userDto == null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var isExist = await _unitOfWork.Repository.FirstOrDefaultAsync(q => (q.UserName == userDto.UserName || q.Email == userDto.Email || (q.PhoneNumber == userDto.PhoneNumber && (userDto.PhoneNumber != "" && userDto.PhoneNumber != null))) && !q.IsDeleted) != null;
            if (isExist) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NotAcceptable, message: HttpStatusCode.NotAcceptable.ToString());
            userDto.SecurityStamp = Guid.NewGuid().ToString();
            userDto.PasswordHash = CreptoHasher.HashPassword(userDto.PasswordHash);           
            var user = Mapper.Map<IUserDto,User>(userDto);
            var userAdded = _unitOfWork.Repository.Add(user);
            await _unitOfWork.SaveChanges();
            return ResponseResult.GetRepositoryActionResult(userDto, status: HttpStatusCode.Created, message: HttpStatusCode.Created.ToString());
        }
        public async Task<IResponseResult> UpdateUser(IUserDto userDto)
        {
            if (userDto == null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var isExist = await _unitOfWork.Repository.FirstOrDefaultAsync(q => (q.UserName == userDto.UserName || q.Email == userDto.Email || (q.PhoneNumber == userDto.PhoneNumber && (userDto.PhoneNumber != "" && userDto.PhoneNumber != null))) && q.Id != userDto.Id && !q.IsDeleted) != null;
            if (isExist) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NotAcceptable, message: HttpStatusCode.NotAcceptable.ToString());
            var original = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == userDto.Id, disableTracking: false);
            userDto.SecurityStamp = Guid.NewGuid().ToString();
            userDto.PasswordHash = CreptoHasher.HashPassword(userDto.PasswordHash);
            if (!string.IsNullOrEmpty(userDto.ImgPath))
            {
                userDto.ImgPath = _imageConfig.SaveImage(userDto.ImgPath, $"User-{Guid.NewGuid().ToString()}", userDto.ImgExtinsion, "PersonalImage");
                if (!string.IsNullOrEmpty(original.ImgPath)) _imageConfig.RemoveImage(original.ImgPath, "PersonalImage");
            }
            else
            {
                userDto.ImgPath = original.ImgPath;
            }
            var user = Mapper.Map<IUserDto, User>(userDto);
            _unitOfWork.Repository.Update(original, user);
            await _unitOfWork.SaveChanges();
            return ResponseResult.GetRepositoryActionResult(userDto, status: HttpStatusCode.Accepted, message: HttpStatusCode.Accepted.ToString());
        }
        public async Task<IResponseResult> RemoveUserById(Guid id)
        {
            if (id == null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var user = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id);
            var original = user;
            user.IsDeleted = true;
            _unitOfWork.Repository.Update(original, user);
            await _unitOfWork.SaveChanges();
            return ResponseResult.GetRepositoryActionResult(true, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        public async Task<IResponseResult> IsUsernameExists(string name, Guid id)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.UserName == name && q.Id != id && !q.IsDeleted);
            return ResponseResult.GetRepositoryActionResult(res != null, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        public async Task<IResponseResult> IsEmailExists(string email, Guid id)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Email == email && q.Id != id && !q.IsDeleted);
            return ResponseResult.GetRepositoryActionResult(res != null, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
        public async Task<IResponseResult> IsPhoneExists(string phone, Guid id)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.PhoneNumber == phone && q.Id != id && !q.IsDeleted);
            return ResponseResult.GetRepositoryActionResult(res != null, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
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
        public async Task<IResponseResult> SaveUserAssigned(AssignUserOnRoleParameters parameters)
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
            return ResponseResult.GetRepositoryActionResult(true, status: HttpStatusCode.Created, message: HttpStatusCode.Created.ToString());
        }
    }
}
