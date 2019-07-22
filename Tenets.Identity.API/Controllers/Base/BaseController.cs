using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Identity.Services.Core;

namespace Tenets.Identity.API.Controllers.Base
{
    /// <inheritdoc />
    [Route("[controller]/[action]")]
    [ApiController]
    [Authorize]
    public class BaseController: ControllerBase
    {
        /// <inheritdoc />
        protected readonly ITokenBusiness TokenBusiness;
        /// <inheritdoc />
        public BaseController()
        {

        }
        /// <inheritdoc />
        public BaseController(ITokenBusiness tokenBusiness)
        {
            TokenBusiness = tokenBusiness;
        }
    }
}
