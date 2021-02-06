using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using BackendCore.Common.Core;
using BackendCore.Common.DTO.Employee;
using BackendCore.Common.FilterDto;
using Employee.Api.Controllers.Base;
using Employee.Service.Services.Employee;

namespace Employee.Api.Controllers
{
    /// <inheritdoc />
    public class EmployeesController : BaseController
    {
        private readonly IEmployeeService _service;
        /// <summary>
        /// Constructor
        /// </summary>
        public EmployeesController(IEmployeeService service)
        {
            _service = service;
        }
        /// <summary>
        /// Get By Id 
        /// </summary>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<IResult> GetAsync(Guid id)
        {
            var result = await _service.GetByIdAsync(id);
            return result;
        }

        /// <summary>
        /// Get All 
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IResult> GetAllAsync()
        {
            var result = await _service.GetAllAsync();
            return result;
        }
        /// <summary>
        /// GetAll with filter
        /// </summary>
        /// <param name="filter">Filter responsible for search and sort</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> GetPagedAsync([FromBody] EmployeeFilterDto filter)
        {
            return await _service.GetAllWithFilterAsync(filter);
        }
        /// <summary>
        /// Add 
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> AddAsync(EmployeeDto dto)
        {
            var result = await _service.AddAsync(dto);
            return result;
        }


        /// <summary>
        /// Update  
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        [HttpPut]
        public async Task<IResult> UpdateAsync(EmployeeDto model)
        {

            return await _service.UpdateAsync(model);
        }
        /// <summary>
        /// Remove  by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        public async Task<IResult> DeleteAsync(Guid id)
        {
            return await _service.DeleteAsync(id);
        }
    }
}
