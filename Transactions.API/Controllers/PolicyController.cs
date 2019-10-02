using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.API.Controllers.Base;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;

namespace Transactions.API.Controllers
{
    /// <summary>
    /// Policy Controller
    /// </summary>
    public class PolicyController : BaseController, IMainEndPoint<PolicyDto>
    {
        private readonly IPolicyServices _policyServices;
        /// <inheritdoc />
        public PolicyController(IPolicyServices policyServices)
        {
            _policyServices = policyServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(PolicyDto model)
        {
            return await _policyServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _policyServices.GetByIdAsync(id);
        }
        /// <summary>
        /// Get data by Customer Id
        /// </summary>
        /// <param name="customerId">customerId</param>
        /// <returns></returns>
        [HttpGet("{customerId}")]
        public async Task<IResult> GetByCustomerId(Guid customerId)
        {
            return await _policyServices.GetByCustomerId(customerId);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _policyServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<PolicyFilter> filter)
        {
            return await _policyServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _policyServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(PolicyDto model)
        {
            return await _policyServices.UpdateAsync(model);
        }
    }
}