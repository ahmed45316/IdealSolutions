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
    /// Nationality Controller
    /// </summary>
    public class NationalityController : BaseController, IMainEndPoint<NationalityDto>
    {
        private readonly INationalityServices _nationalityServices;
        /// <inheritdoc />
        public NationalityController(INationalityServices nationalityServices)
        {
            _nationalityServices = nationalityServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(NationalityDto model)
        {      
            return await _nationalityServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _nationalityServices.GetByIdAsync(id);
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
            return await _nationalityServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _nationalityServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <param name="filter">Filter responsible for search and sort</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<MainFilter> filter)
        {
            return await _nationalityServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// GetAll Data paged for dropdown
        /// </summary>
        /// <param name="filter">Filter resposiable for search</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetDropDown([FromBody]BaseParam<SearchCriteriaFilter> filter)
        {
            return await _nationalityServices.GetDropDownAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _nationalityServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(NationalityDto model)
        {        
            return await _nationalityServices.UpdateAsync(model);
        }
    }
}