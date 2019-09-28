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
        /// <inheritdoc />
        public AccountsController(ILoginServices loginServices,ITokenBusiness tokenBusiness): base(tokenBusiness)
        {
            _loginServices = loginServices;
        }
        /// <summary>
        /// Login 
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        [HttpPost]
        [AllowAnonymous]
        public async Task<IResult> Login(LoginParameters parameter)
        {
            return await _loginServices.Login(parameter);
        }
    }
}