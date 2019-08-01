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

namespace Codes.API.Controllers
{
    /// <inheritdoc />
    public class CountryController : BaseController,IMainEndPoint<CountryDto>
    {
        private readonly ICountryServices _countryServices;
        /// <inheritdoc />
        public CountryController(ICountryServices countryServices)
        {
            _countryServices = countryServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(CountryDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _countryServices.AddAsync(model, userId);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _countryServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _countryServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <param name="filter">Filter resposiable for search and sort</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetAll(MainFilter filter)
        {
            return await _countryServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _countryServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(CountryDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _countryServices.UpdateAsync(model, userId);
        }
    }
}