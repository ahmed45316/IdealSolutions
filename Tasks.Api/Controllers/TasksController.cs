using System;
using System.Threading.Tasks;
using BackendCore.Common.Core;
using BackendCore.Common.DTO.Task;
using Microsoft.AspNetCore.Mvc;
using Tasks.Api.Controllers.Base;
using Tasks.Service.Services.Task;

namespace Tasks.Api.Controllers
{
    /// <inheritdoc />
    public class TasksController : BaseController
    {
        private readonly ITaskService _service;
        /// <summary>
        /// Constructor
        /// </summary>
        public TasksController(ITaskService service)
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
        /// Add 
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IResult> AddAsync([FromBody] TaskDto dto)
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
        public async Task<IResult> UpdateAsync(TaskDto model)
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
