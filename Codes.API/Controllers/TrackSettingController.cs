using System;
using System.Threading.Tasks;
using Codes.API.Controllers.Base;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.API.Controllers
{
    /// <summary>
    /// Track Setting Controller
    /// </summary>
    public class TrackSettingController : BaseController,IMainEndPoint<TrackSettingDto>
    {
        private readonly ITrackSettingServices _trackSettingServices;
        /// <inheritdoc />
        public TrackSettingController(ITrackSettingServices trackSettingServices)
        {
            _trackSettingServices = trackSettingServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(TrackSettingDto model)
        {
            return await _trackSettingServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _trackSettingServices.GetByIdAsync(id);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<IResult> GetForReport(Guid id)
        {
            return await _trackSettingServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _trackSettingServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <param name="filter">Filter resposiable for search and sort</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<TrackSettingFilter> filter)
        {
            return await _trackSettingServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// GetAll Data paged for dropdown
        /// </summary>
        /// <param name="filter">Filter resposiable for search</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetDropDown([FromBody]BaseParam<SearchCriteriaFilter> filter)
        {
            return await _trackSettingServices.GetDropDownAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _trackSettingServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(TrackSettingDto model)
        {
            return await _trackSettingServices.UpdateAsync(model);
        }
    }
}