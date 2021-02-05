using BackendCore.Common.DTO.Task;
using Tasks.Service.Services.Base;

namespace Tasks.Service.Services.Task
{
    public interface ITaskService : IBaseService<Entities.Task, TaskDto>
    {
    }
}
