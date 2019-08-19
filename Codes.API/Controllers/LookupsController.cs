using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Codes.API.Controllers.Base;
using Codes.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;

namespace Codes.API.Controllers
{
    /// <inherit doc />
    public class LookupsController : BaseController
    {
        private readonly ILookupsServices _lookupsServices;
        /// <inheritdoc />
        public LookupsController(ILookupsServices lookupsServices)
        {
            _lookupsServices = lookupsServices;
        }
        /// <summary>
        /// Get all lookups in end point data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetLookups()
        {
            return await _lookupsServices.GetAllLookupsForPolicy();
        }
    }
}