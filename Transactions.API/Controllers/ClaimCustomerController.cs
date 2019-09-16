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
    /// Claim Customer Controller
    /// </summary>
    public class ClaimCustomerController : BaseController, IMainEndPoint<ClaimCustomerDto>
    {
        private readonly IClaimCustomerServices _claimCustomerServices;
        /// <inheritdoc />
        public ClaimCustomerController(IClaimCustomerServices claimCustomerServices)
        {
            _claimCustomerServices = claimCustomerServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(ClaimCustomerDto model)
        {
            return await _claimCustomerServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _claimCustomerServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _claimCustomerServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<ClaimCustomerFilter> filter)
        {
            return await _claimCustomerServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _claimCustomerServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(ClaimCustomerDto model)
        {
            return await _claimCustomerServices.UpdateAsync(model);
        }
    }
}