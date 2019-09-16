using System.Collections.Generic;
using System.Threading.Tasks;
using Codes.API.Controllers.Base;
using Codes.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;

namespace Codes.API.Controllers
{
    /// <inherit  />
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
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetLookups()
        {
            return await _lookupsServices.GetAllLookupsForPolicy();
        }
        /// <summary>
        /// Get Type for CustomerName or Rent Name  
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> GetTypeNameForOpeningBalance(IEnumerable<OpeningBalanceParameters> parameters)
        {
            return await _lookupsServices.GetTypeNameForOpeningBalance(parameters);
        }
        
    }
}