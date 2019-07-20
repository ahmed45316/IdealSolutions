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
        public UserController(IHandlerResponse responseHandler, IUserServices userServices) : base(responseHandler)
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
            var repositoryResult = await _userServices.GetAllAsync();
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Get data by PK id in table 
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns>Object for id choosen</returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            var repositoryResult = await _userServices.GetByIdAsync(id);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Add new data in database
        /// </summary>
        /// <param name="model">Object load data</param>
        /// <returns>Object after add</returns>
        [HttpPost]
        public async Task<IResult> Add(UserDto model)
        {
            var repositoryResult = await _userServices.AddAsync(model);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Edit object
        /// </summary>
        /// <param name="model">Object to be Edit</param>
        /// <returns>Object after editable</returns>
        [HttpPut]
        public async Task<IResult> Update(UserDto model)
        {
            var repositoryResult = await _userServices.UpdateAsync(model);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Hide object of data in database make isDelete:false 
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns>Statue of Remove</returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            var repositoryResult = await _userServices.DeleteAsync(id);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Get Users
        /// </summary>
        /// <returns></returns>
        [HttpPost()]
        public async Task<IDataPagging> GetAllUsers(GetAllUserParameters parameters)
        {
            var repositoryResult = await _userServices.GetUsers(parameters);
            return repositoryResult;
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
            var repositoryResult = type == 3 ? await _userServices.IsPhoneExists(name, id) : type == 2 ? await _userServices.IsEmailExists(name, id) : await _userServices.IsUsernameExists(name, id);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
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
            var repositoryResult = await _userServices.SaveUserAssigned(parameters);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
    }
}