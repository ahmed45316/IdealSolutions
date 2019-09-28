using System;
using System.Threading.Tasks;
using Codes.API.Controllers.Base;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Parameters;

namespace Codes.API.Controllers
{
    /// <summary>
    /// Track Price Controller
    /// </summary>
    public class TrackPriceController : BaseController, IMainEndPoint<TrackPriceDto>
    {
        private readonly ITrackPriceServices _trackPriceServices;
        /// <inheritdoc />
        public TrackPriceController(ITrackPriceServices trackPriceServices)
        {
            _trackPriceServices = trackPriceServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(TrackPriceDto model)
        {

            return await _trackPriceServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _trackPriceServices.GetByIdAsync(id);
        }
        /// <summary>
        /// Get data by CustomerId
        /// </summary>
        /// <param name="trackPriceBasedOnParameters"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> GetByCustomerId(TrackPriceBasedOnParameters trackPriceBasedOnParameters)
        {
            return await _trackPriceServices.GetByCustomerIdAsync(trackPriceBasedOnParameters.CustomerId, trackPriceBasedOnParameters.PolicyDate);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _trackPriceServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll car types
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAllCarTypes()
        {
            return await _trackPriceServices.GetTrackPriceDetailCarType();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <param name="filter">Filter resposiable for search and sort</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<TrackPriceFilter> filter)
        {
            return await _trackPriceServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _trackPriceServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(TrackPriceDto model)
        {

            return await _trackPriceServices.UpdateAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="trackPriceBasedOnParameters"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> GetValueForTrack(TrackPriceBasedOnParameters trackPriceBasedOnParameters)
        {
            return await _trackPriceServices.GetValueForTrack(trackPriceBasedOnParameters.CustomerId, trackPriceBasedOnParameters.PolicyDate, trackPriceBasedOnParameters.Id??Guid.Empty);
        }
    }
}