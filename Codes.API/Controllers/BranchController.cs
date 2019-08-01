using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Codes.API.Controllers.Base;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;

namespace Codes.API.Controllers
{
    /// <inheritdoc />
    public class BranchController : BaseController,IMainEndPoint<BranchDto>
    {
        private readonly IBranchServices _BranchServices;
        /// <inheritdoc />
        public BranchController(IBranchServices BranchServices)
        {
            _BranchServices = BranchServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(BranchDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _BranchServices.AddAsync(model, userId);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _BranchServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _BranchServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BranchFilter filter)
        {
            return await _BranchServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _BranchServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(BranchDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _BranchServices.UpdateAsync(model, userId);
        }
    }
}