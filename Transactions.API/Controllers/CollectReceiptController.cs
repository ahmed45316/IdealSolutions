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
    public class CollectReceiptController : BaseController, IMainEndPoint<CollectReceiptDto>
    {
        private readonly ICollectReceiptServices _collectReceiptServices;
        /// <inheritdoc />
        public CollectReceiptController(ICollectReceiptServices collectReceiptServices)
        {
            _collectReceiptServices = collectReceiptServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(CollectReceiptDto model)
        {
            return await _collectReceiptServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _collectReceiptServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _collectReceiptServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Payment Types
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IResult GetAllPaymentTypes()
        {
            return _collectReceiptServices.GetAllPaymentType();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<CollectReceiptFilter> filter)
        {
            return await _collectReceiptServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _collectReceiptServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(CollectReceiptDto model)
        {
            return await _collectReceiptServices.UpdateAsync(model);
        }
    }
}