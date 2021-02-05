using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using BackendCore.Common.Core;
using BackendCore.Common.DTO.Task;
using BackendCore.Common.Extensions;
using Microsoft.EntityFrameworkCore;
using Tasks.Service.Services.Base;
// ReSharper disable ArrangeModifiersOrder

namespace Tasks.Service.Services.Task
{
    public class TaskService : BaseService<Entities.Task, TaskDto>, ITaskService
    {
        public TaskService(IServiceBaseParameter<Entities.Task> parameters) : base(parameters)
        {
        }

        public async override Task<IResult> GetAllAsync()
        {
            var sortCriteria = new List<SortModel>();
            var sort = new SortModel();
            sortCriteria.Add(sort);
            var query = await UnitOfWork.Repository.GetAllAsync(sortCriteria, src => src.Include(t => t.Employee));
            var data = Mapper.Map<IEnumerable<TaskDto>>(query);
            return ResponseResult.PostResult(data, status: HttpStatusCode.OK,
                message: HttpStatusCode.OK.ToString());
        }

        public async override Task<IResult> GetByIdAsync(Guid id)
        {
            var query = await UnitOfWork.Repository.FirstOrDefaultAsync(q => q.Id == id, include: src => src.Include(t => t.Employee));
            var data = Mapper.Map<TaskDto>(query);
            return ResponseResult.PostResult(result: data, status: HttpStatusCode.OK,
                message: "Data Retrieved Successfully");
        }
    }
}
