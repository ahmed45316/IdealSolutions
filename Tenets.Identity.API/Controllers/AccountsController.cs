using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Parameters;
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
        public AccountsController(ILoginServices loginServices,ITokenBusiness tokenBusiness, IMenuServices menuServices): base(tokenBusiness)
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
            return await _loginServices.Login(parameter);
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
            return await _menuServices.GetMenu(new Guid(userId));
        }
    }
}