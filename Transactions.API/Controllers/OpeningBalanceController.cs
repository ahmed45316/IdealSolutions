using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Transactions.API.Controllers.Base;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;

namespace Transactions.API.Controllers
{
    /// <inheritdoc />
    public class OpeningBalanceController : BaseController, IMainEndPoint<OpeningBalanceDto>
    {
        private readonly IOpeningBalanceServices _openingBalanceServices;
        /// <inheritdoc />
        public OpeningBalanceController(IOpeningBalanceServices openingBalanceServices)
        {
            _openingBalanceServices = openingBalanceServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(OpeningBalanceDto model)
        {
            return await _openingBalanceServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _openingBalanceServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _openingBalanceServices.GetAllAsync();
        }
        ///// <summary>
        ///// GetAll Data paged
        ///// </summary>
        ///// <returns></returns>
        //[HttpPost]
        //public async Task<IDataPagging> GetPaged([FromBody]BaseParam<PolicyFilter> filter)
        //{
        //    return await _openingBalanceServices.GetAllPaggedAsync(filter);
        //}
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _openingBalanceServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(OpeningBalanceDto model)
        {
            return await _openingBalanceServices.UpdateAsync(model);
        }
    }
}