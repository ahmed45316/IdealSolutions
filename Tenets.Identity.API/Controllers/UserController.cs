using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Identity.Parameters;
using Tenets.Identity.API.Controllers.Base;
using Tenets.Identity.Services.Dto;
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
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<UserFilter> filter)
        {
            return await _userServices.GetUsers(filter);
        }
        /// <summary>
        ///check if is super admin
        /// </summary>
        /// <param name="userId">user Id</param>
        /// <returns>Object for id choosen</returns>
        [HttpGet("{userId}")]
        public async Task<bool> IsSuperAdmin(Guid userId)
        {
            return await _userServices.IsSuperAdmin(userId);
        }
    }
}