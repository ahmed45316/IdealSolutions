using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Transactions.API.Controllers.Base;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;

namespace Transactions.API.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class CommunicationController : BaseController
    {
        private readonly ICommunicationServices _communicationServices;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="communicationServices"></param>
        public CommunicationController(ICommunicationServices communicationServices)
        {
            _communicationServices = communicationServices;
        }

        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Add(CustomerDto model)
        {
            _communicationServices.AddAsync(model);
            return Ok();
        }

        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public IActionResult Remove(Guid id)
        {
            _communicationServices.DeleteAsync(id);
            return Ok();
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public IActionResult Update(CustomerDto model)
        {
            _communicationServices.UpdateAsync(model);
            return Ok();
        }
    }
}