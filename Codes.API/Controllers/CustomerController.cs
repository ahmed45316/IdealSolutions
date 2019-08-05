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
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.API.Controllers
{
    /// <inheritdoc />
    public class CustomerController : BaseController,IMainEndPoint<CustomerDto>
    {
        private readonly ICustomerServices _customerServices;
        /// <inheritdoc />
        public CustomerController(ICustomerServices customerServices)
        {
            _customerServices = customerServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(CustomerDto model)
        {
            
            return await _customerServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _customerServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _customerServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <param name="filter">Filter resposiable for search and sort</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<CustomerFilter> filter)
        {
            return await _customerServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// GetAll Data paged for dropdown
        /// </summary>
        /// <param name="filter">Filter resposiable for search</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetDropDown([FromBody]BaseParam<SearchCriteriaFilter> filter)
        {
            return await _customerServices.GetDropDownAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _customerServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(CustomerDto model)
        {
            
            return await _customerServices.UpdateAsync(model);
        }
    }
}