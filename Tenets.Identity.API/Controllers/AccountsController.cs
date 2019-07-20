using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.Identity.Parameters;
using Tenets.Identity.API.Controllers.Base;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Interfaces;

namespace Tenets.Identity.API.Controllers
{
    /// <inheritdoc />
    public class AccountsController : BaseController
    {
        private readonly ILoginServices _loginServices;
        private readonly IMenuServices _menuServices;
        /// <inheritdoc />
        public AccountsController(IHandlerResponse responseHandler,
            ILoginServices loginServices,
            ITokenBusiness tokenBusiness, IMenuServices menuServices)
            : base(responseHandler, tokenBusiness)
        {
            _loginServices = loginServices;
            _menuServices = menuServices;
        }
        /// <summary>
        /// Login 
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        [HttpPost(nameof(Login))]
        [AllowAnonymous]
        public async Task<IResult> Login(LoginParameters parameter)
        {
            var repositoryResult = await _loginServices.Login(parameter);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Get Menu
        /// </summary>
        /// <returns></returns>
        [HttpGet(nameof(GetMenu))]
        [Authorize]
        public async Task<IResult> GetMenu()
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            var repositoryResult = await _menuServices.GetMenu(new Guid(userId));
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
    }
}