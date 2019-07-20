using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Hasher;
using Tenets.Common.Identity.Dto;
using Tenets.Common.Identity.Interface;
using Tenets.Common.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Interfaces;

namespace Tenets.Identity.Services.Services
{
    public class LoginServices : BaseService<User,IUserDto>, ILoginServices
    {
        private readonly ITokenBusiness _tokenBusiness;
        public LoginServices(IServiceBaseParameter<User> businessBaseParameter, ITokenBusiness tokenBusiness) : base(businessBaseParameter)
        {
            _tokenBusiness = tokenBusiness;
        }
        public async Task<IResponseResult> Login(byte type,LoginParameters parameters)
        {
            var user = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.UserName == parameters.Username && !q.IsDeleted,include:source=>source.Include(a=>a.UsersRole),disableTracking:false);
            if (user==null) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.BadRequest,
                             message: "Wrong Username or Password");
            bool rightPass = CreptoHasher.VerifyHashedPassword(user.PasswordHash, parameters.Password);
            if (!rightPass) return ResponseResult.GetRepositoryActionResult(status: HttpStatusCode.NotFound, message: "Wrong Password");
            var refToken = Guid.NewGuid().ToString();
            var roles = user.UsersRole.Select(q => q.RoleId).ToList();
            var userDto = Mapper.Map<User, IUserDto>(user);
            var userLoginReturn = _tokenBusiness.GenerateJsonWebToken(userDto, string.Join(",", roles), refToken);
            return ResponseResult.GetRepositoryActionResult(userLoginReturn, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()); 
        }
    }
}
