using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.Identity.Dto;
using Tenets.Common.Identity.Interface;
using Tenets.Common.Identity.Parameters;
using Tenets.Identity.API.Controllers.Base;
using Tenets.Identity.Services.Interfaces;

namespace Tenets.Identity.API.Controllers
{
    /// <inheritdoc />
    public class UserController : BaseController, IMainEndPoint<UserDto>
    {
        private readonly IUserServices _userServices;
        /// <inheritdoc />
        public UserController(IUserServices userServices)
        {
            _userServices = userServices;
        }
        /// <summary>
        /// Get all data in list 
        /// </summary>
        /// <returns>List of Data</returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _userServices.GetAllAsync();
        }
        /// <summary>
        /// Get data by PK id in table 
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns>Object for id choosen</returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _userServices.GetByIdAsync(id);
        }
        /// <summary>
        /// Add new data in database
        /// </summary>
        /// <param name="model">Object load data</param>
        /// <returns>Object after add</returns>
        [HttpPost]
        public async Task<IResult> Add(UserDto model)
        {
            return await _userServices.AddAsync(model);
        }
        /// <summary>
        /// Edit object
        /// </summary>
        /// <param name="model">Object to be Edit</param>
        /// <returns>Object after editable</returns>
        [HttpPut]
        public async Task<IResult> Update(UserDto model)
        {
            return await _userServices.UpdateAsync(model);
        }
        /// <summary>
        /// Hide object of data in database make isDelete:false 
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns>Statue of Remove</returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _userServices.DeleteAsync(id);
        }
        /// <summary>
        /// Get Users
        /// </summary>
        /// <returns></returns>
        [HttpPost()]
        public async Task<IDataPagging> GetAllUsers(GetAllUserParameters parameters)
        {
            return await _userServices.GetUsers(parameters);
        }
        /// <summary>
        /// Check Fields IsExists
        /// </summary>
        /// <param name="name"></param>
        /// <param name="type"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{name}/{type}/{id?}")]
        public async Task<IResult> IsExists(string name, byte type, Guid? id = null)
        {
            return type == 3 ? await _userServices.IsPhoneExists(name, id) : type == 2 ? await _userServices.IsEmailExists(name, id) : await _userServices.IsUsernameExists(name, id);
        }
        /// <summary>
        /// Get Users Select2
        /// </summary>
        /// <param name="pageSize"></param>
        /// <param name="pageNumber"></param>
        /// <param name="searchTerm"></param>
        /// <returns></returns>
        [HttpGet()]
        public async Task<IActionResult> GetUsersSelect2(int pageSize, int pageNumber, string searchTerm = null)
        {
            return Ok(await _userServices.GetUsersSelect2(searchTerm, pageSize, pageNumber));
        }
        /// <summary>
        /// Get users to assigned to Role 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetUserAssigned(Guid id)
        {
            return Ok(await _userServices.GetUserAssignedSelect2(id));
        }
        /// <summary>
        /// Save User assigned
        /// </summary>
        /// <param name="parameters"></param>
        /// <returns></returns>
        [HttpPost()]
        public async Task<IResult> SaveUserAssigned([FromForm]AssignUserOnRoleParameters parameters)
        {
            return await _userServices.SaveUserAssigned(parameters);
        }
    }
}