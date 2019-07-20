using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Identity.Dto;
using Tenets.Common.Identity.Interface;
using Tenets.Common.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Interfaces;
using Tenets.Common.Extensions;
namespace Tenets.Identity.Services.Services
{
    public class RoleServices : BaseService<Role, IRoleDto, RoleDto>, IRoleServices
    {
        public RoleServices(IServiceBaseParameter<Role> businessBaseParameter) : base(businessBaseParameter)
        {

        }
        public async Task<IDataPagging> GetRoles(GetAllRoleParameters parameters)
        {
            var roles = string.IsNullOrEmpty(parameters.RoleName) ? await _unitOfWork.Repository.FindAsync(q => !q.IsDeleted && q.Id != new Guid(AdmistratorRoleId), include: source => source.Include(a => a.UsersRole), disableTracking: false) : await _unitOfWork.Repository.FindAsync(q => !q.IsDeleted && q.Id != new Guid(AdmistratorRoleId) && q.Name.Contains(parameters.RoleName), include: source => source.Include(a => a.UsersRole), disableTracking: false);
            var rolesPagging = roles.AsQueryable().OrderBy(parameters.OrderByValue).Skip(parameters.PageNumber).Take(parameters.PageSize).ToList();
            if (!rolesPagging.Any())
            {
                var res = ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
                return new DataPagging(0, 0, 0, res);
            };
            var RolesDto = Mapper.Map<IEnumerable<Role>, IEnumerable<IRoleDto>>(rolesPagging);
            var repoResult = ResponseResult.GetRepositoryActionResult(RolesDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            return new DataPagging(parameters.PageNumber, parameters.PageSize, roles.Count(), repoResult);
        }
        public async Task<IResponseResult> GetRole(Guid Id)
        {

            var role = await _unitOfWork.Repository.GetAsync(Id);
            if (role == null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var roleDto = Mapper.Map<Role, IRoleDto>(role);
            return ResponseResult.GetRepositoryActionResult(roleDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }

        public async Task<IResponseResult> UpdateRole(IRoleDto model)
        {
            if (model == null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var role = Mapper.Map<IRoleDto, Role>(model);
            var isExist = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Name == model.Name && q.Id != model.Id && !q.IsDeleted) != null;
            if (isExist) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.BadRequest, message: HttpStatusCode.BadRequest.ToString());
            var original = await _unitOfWork.Repository.GetAsync(model.Id);
            _unitOfWork.Repository.Update(original, role);
            await _unitOfWork.SaveChanges();
            var RoleDto = await GetRole(role.Id);
            return RoleDto;
        }
        public async Task<IResponseResult> RemoveRoleById(Guid id)
        {

            if (id == null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NoContent, message: HttpStatusCode.NoContent.ToString());
            var role = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id, include: source => source.Include(a => a.UsersRole).Include(b => b.Menu), disableTracking: false);
            var original = role;
            if (role.UsersRole.Count > 0 || role.Menu.Count > 0)
                return ResponseResult.GetRepositoryActionResult(false, status: HttpStatusCode.Forbidden, message: HttpStatusCode.Forbidden.ToString());
            role.IsDeleted = true;
            _unitOfWork.Repository.Update(original,role);
            await _unitOfWork.SaveChanges();
            return ResponseResult.GetRepositoryActionResult(true, status: HttpStatusCode.Accepted, message: HttpStatusCode.Accepted.ToString());
        }
        // Check IsExists
        public async Task<IResponseResult> IsNameExists(string name, string id)
        {
            var res = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.Name == name && q.Id != new Guid(id) && !q.IsDeleted);
            return ResponseResult.GetRepositoryActionResult(res != null, status: HttpStatusCode.Accepted, message: HttpStatusCode.Accepted.ToString());
        }

    }
}
