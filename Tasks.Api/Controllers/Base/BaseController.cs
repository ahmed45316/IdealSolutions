using Microsoft.AspNetCore.Mvc;

namespace Tasks.Api.Controllers.Base
{
    /// <inheritdoc />
    [Route("[controller]/[action]")]
    [ApiController]
    //[Authorize]
    public class BaseController : ControllerBase
    {
        /// <summary>
        /// 
        /// </summary>
        /// <inheritdoc />
        public BaseController()
        {

        }
    }
}