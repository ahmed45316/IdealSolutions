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
    public class PageController : BaseController
    {
        private readonly IMenuServices _menuServices;
        /// <inheritdoc />
        public PageController(ITokenBusiness tokenBusiness, IMenuServices menuServices) : base(tokenBusiness)
        {
            _menuServices = menuServices;
        }
        /// <summary>
        /// Get Screens Select2
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <param name="searchTerm"></param>
        /// <param name="lang"></param>
        /// <returns></returns>
        [HttpGet()]
        public async Task<IActionResult> GetScreensSelect2(int pageSize, int pageNumber, string searchTerm = null, string lang = "ar-EG")
        {
            return Ok(await _menuServices.GetScreensSelect2(searchTerm, pageSize, pageNumber, lang));
        }
        /// <summary>
        /// Get child Screens Select2
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <param name="parentId"></param>
        /// <param name="searchTerm"></param>
        /// <param name="lang"></param>
        /// <returns></returns>
        [HttpGet()]
        public async Task<IActionResult> GetChildScreensSelect2(int pageSize, int pageNumber, string parentId, string searchTerm = null, string lang = "ar-EG")
        {
            return Ok(await _menuServices.GetChildScreensSelect2(searchTerm, pageSize, pageNumber, new Guid(parentId), lang));
        }
        /// <summary>
        /// Get Screen NotSelected
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="menuId"></param>
        /// <param name="childId"></param>
        /// <returns></returns>
        [HttpGet("{roleId}/{menuId?}/{childId?}")]
        public async Task<IResult> GetScreenData(Guid roleId, Guid? menuId = null, Guid? childId = null)
        {
            return await _menuServices.GetScreens(roleId, menuId, childId);
        }
        /// <summary>
        /// Get Screen Selected
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="menuId"></param>
        /// <param name="childId"></param>
        /// <returns></returns>
        [HttpGet("{roleId}/{menuId?}/{childId?}")]
        public async Task<IResult> GetScreenDataSelected(Guid roleId, Guid? menuId = null, Guid? childId = null)
        {
            return await _menuServices.GetScreensSelected(roleId, menuId, childId);
        }
        /// <summary>
        /// Save Screens
        /// </summary>
        /// <param name="parameters"></param>
        /// <returns></returns>
        [HttpPost()]
        public async Task<IResult> SaveScreens([FromForm]ScreensAssignedParameters parameters)
        {
            return await _menuServices.SaveScreens(parameters);
        }
    }
}