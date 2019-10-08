using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using CodeShellCore.Reporting;
using CodeShellCore.Reporting.Services;
using CodeShellCore.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.API.Controllers.Base;
using Transactions.API.ReportModels;
using Transactions.Services.Dto;
using Transactions.Services.Interfaces;
using Transactions.Services.ReportsDto;

namespace Transactions.API.Controllers
{
    /// <summary>
    /// Policy Controller
    /// </summary>
    public class PolicyController : BaseController, IMainEndPoint<PolicyDto>
    {
        private readonly IPolicyServices _policyServices;
        private readonly RdlcDataSetGenerator _generator;
        /// <inheritdoc />
        public PolicyController(IPolicyServices policyServices, RdlcDataSetGenerator generator)
        {
            _policyServices = policyServices;
            _generator = generator;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> Add(PolicyDto model)
        {
            return await _policyServices.AddAsync(model);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> Get(Guid id)
        {
            return await _policyServices.GetByIdAsync(id);
        }
        /// <summary>
        /// Get data by Customer Id
        /// </summary>
        /// <param name="customerId">customerId</param>
        /// <returns></returns>
        [HttpGet("{customerId}")]
        public async Task<IResult> GetByCustomerId(Guid customerId)
        {
            return await _policyServices.GetByCustomerId(customerId);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAll()
        {
            return await _policyServices.GetAllAsync();
        }
        /// <summary>
        /// GetAll Data paged
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public async Task<IDataPagging> GetPaged([FromBody]BaseParam<PolicyFilter> filter)
        {
            return await _policyServices.GetAllPaggedAsync(filter);
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> Remove(Guid id)
        {
            return await _policyServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> Update(PolicyDto model)
        {
            return await _policyServices.UpdateAsync(model);
        }
        /// <summary>
        /// Generate Reports
        /// </summary>
        //[HttpGet]
        //public IActionResult GenerateReport()
        //{
        //    _generator.Bind(new PolicyReportModel());
        //    return Content("done");
        //}

        [HttpGet("{id}")]
        public async Task<IActionResult> GetReport(Guid id)
        {
            try
            {
                var policy =await _policyServices.GetPolicyForReport(id);
                var model = new PolicyReportModel
                {
                    Policies = new List<PolicyViewModel>
                    {
                        policy
                    }
                };
                System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
                var s = ReportMaker.CreateFor(model);
                return s.GetFile().ToFileResult();

            }

            catch (Exception e)
            {
                return Ok(e.Message);
            }
        }
    }
}