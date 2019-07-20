
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Identity.Dto;
using Tenets.Common.Identity.Parameters;
using Tenets.Identity.API.Controllers.Base;
using Tenets.Identity.Services.Interfaces;

namespace Tenets.API.Controllers.Secuirty
{
    /// <inheritdoc />
    public class RoleController : BaseController, IMainEndPoint<RoleDto>
    {
        private readonly IRoleServices _roleServices;

        /// <inheritdoc />
        public RoleController(IHandlerResponse responseHandler,IRoleServices roleServices) : base(responseHandler)
        {
            _roleServices = roleServices;
        }
        /// <summary>
        /// Get all data in list 
        /// </summary>
        /// <returns>List of Data</returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            var repositoryResult = await _roleServices.GetAllAsync();
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
            var repositoryResult = await _roleServices.GetByIdAsync(id);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Add new data in database
        /// </summary>
        /// <param name="model">Object load data</param>
        /// <returns>Object after add</returns>
        [HttpPost]
        public async Task<IResult> Add(RoleDto model)
        {
            var repositoryResult = await _roleServices.AddAsync(model);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Edit object
        /// </summary>
        /// <param name="model">Object to be Edit</param>
        /// <returns>Object after editable</returns>
        [HttpPut]
        public async Task<IResult> Update(RoleDto model)
        {
            var repositoryResult = await _roleServices.UpdateAsync(model);
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
            var repositoryResult = await _roleServices.DeleteAsync(id);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        /// <summary>
        /// Get All Roles
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetAllRoles(GetAllRoleParameters parameters)
        {
            var repositoryResult = await _roleServices.GetRoles(parameters);
            return repositoryResult;
        }
        /// <summary>
        /// check Name is Exists
        /// </summary>
        /// <param name="name"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{name}/{id?}")]
        public async Task<IResult> IsNameExists(string name, string id = null)
        {
            var repositoryResult = await _roleServices.IsNameExists(name,id);
            var result = ResponseHandler.GetResult(repositoryResult);
            return result;
        }
        
    }
}