using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Hasher;
using Tenets.Common.ServicesCommon.Identity.Parameters;
using Tenets.Identity.Entities;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Dto;
using Tenets.Identity.Services.Interfaces;

namespace Tenets.Identity.Services.Services
{
    public class LoginServices : BaseService<User,UserDto>, ILoginServices
    {
        private readonly ITokenBusiness _tokenBusiness;
        public LoginServices(IServiceBaseParameter<User> businessBaseParameter, ITokenBusiness tokenBusiness) : base(businessBaseParameter)
        {
            _tokenBusiness = tokenBusiness;
        }
        public async Task<IResult> Login(LoginParameters parameters)
        {
            var user = await _unitOfWork.Repository.FirstOrDefaultAsync(q => q.UserName == parameters.Username && !q.IsDeleted,include:source=>source.Include(a=>a.Role),disableTracking:false);
            if (user==null) return ResponseResult.PostResult(status: HttpStatusCode.BadRequest,
                             message: "Wrong Username or Password");
            bool rightPass = CreptoHasher.VerifyHashedPassword(user.Password, parameters.Password);
            if (!rightPass) return ResponseResult.PostResult(status: HttpStatusCode.NotFound, message: "Wrong Password");
            var role = user.Role.Name;
            var userDto = Mapper.Map<User, UserDto>(user);
            var userLoginReturn = _tokenBusiness.GenerateJsonWebToken(userDto, role.ToString());
            return ResponseResult.PostResult(userLoginReturn, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString()); 
        }
    }
}
