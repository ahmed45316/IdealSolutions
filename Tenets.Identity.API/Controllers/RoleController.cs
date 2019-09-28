using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Identity.API.Controllers.Base;
using Tenets.Identity.Services.Dto;
using Tenets.Identity.Services.Interfaces;

namespace Tenets.API.Controllers.Secuirty
{
    /// <inheritdoc />
    public class RoleController : BaseController, IMainEndPoint<RoleDto>
    {
        private readonly IRoleServices _roleServices;

        /// <inheritdoc />
        public RoleController(IRoleServices roleServices)
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
            return await _roleServices.GetAllAsync();
        }
        /// <summary>
        /// Get data by PK id in table 
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns>Object for id choosen</returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _roleServices.GetByIdAsync(id);
        }
        /// <summary>
        /// Add new data in database
        /// </summary>
        /// <param name="model">Object load data</param>
        /// <returns>Object after add</returns>
        [HttpPost]
        public async Task<IResult> Add(RoleDto model)
        {
            return await _roleServices.AddAsync(model);
        }
        /// <summary>
        /// Edit object
        /// </summary>
        /// <param name="model">Object to be Edit</param>
        /// <returns>Object after editable</returns>
        [HttpPut]
        public async Task<IResult> Update(RoleDto model)
        {
            return await _roleServices.UpdateAsync(model);
        }
        /// <summary>
        /// Hide object of data in database make isDelete:false 
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns>Statue of Remove</returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _roleServices.DeleteAsync(id);
        }
       
    }
}