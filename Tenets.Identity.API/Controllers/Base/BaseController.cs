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
        protected readonly IHandlerResponse ResponseHandler;
        /// <inheritdoc />
        public BaseController(IHandlerResponse responseHandler)
        {
            ResponseHandler = responseHandler;
        }
        /// <inheritdoc />
        public BaseController(IHandlerResponse responseHandler, ITokenBusiness tokenBusiness)
        {
            ResponseHandler = responseHandler;
            TokenBusiness = tokenBusiness;
        }
    }
}
