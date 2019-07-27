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

namespace Codes.API.Controllers
{
    /// <inheritdoc />
    public class TaxTypeController : BaseController,IMainEndPoint<TaxTypeDto>
    {
        private readonly ITaxTypeServices _TaxTypeServices;
        /// <inheritdoc />
        public TaxTypeController(ITaxTypeServices TaxTypeServices)
        {
            _TaxTypeServices = TaxTypeServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(TaxTypeDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _TaxTypeServices.AddAsync(model, userId);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _TaxTypeServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _TaxTypeServices.GetAllAsync();
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _TaxTypeServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(TaxTypeDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _TaxTypeServices.UpdateAsync(model, userId);
        }
    }
}