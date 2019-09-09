using System;
using System.Threading.Tasks;
using Codes.API.Controllers.Base;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.API.Controllers
{
    /// <summary>
    /// Rent Controller
    /// </summary>
    public class RentController : BaseController,IMainEndPoint<RentDto>
    {
        private readonly IRentServices _rentServices;
        /// <inheritdoc />
        public RentController(IRentServices rentServices)
        {
            _rentServices = rentServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(RentDto model)
        {
            
            return await _rentServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _rentServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _rentServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <param name="filter">Filter resposiable for search and sort</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<RentFilter> filter)
        {
            return await _rentServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// GetAll Data paged for dropdown
        /// </summary>
        /// <param name="filter">Filter resposiable for search</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetDropDown([FromBody]BaseParam<SearchCriteriaFilter> filter)
        {
            return await _rentServices.GetDropDownAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _rentServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(RentDto model)
        {
            
            return await _rentServices.UpdateAsync(model);
        }
    }
}