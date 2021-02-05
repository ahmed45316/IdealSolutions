using AutoMapper;
using BackendCore.Common.DTO.Task;
using BackendCore.Common.Events;
using Tasks.Entities;

namespace Tasks.Service.Mapping
{
    public partial class MappingService : Profile
    {
        public MappingService()
        {
            MapTask();
            MapEmployee();
        }
        public void MapTask()
        {
            CreateMap<TaskDto, Task>().ReverseMap()
                .ForMember(dest => dest.FullEmployeeName, opt => opt.MapFrom(src => src.Employee.FullName));
        }
        public void MapEmployee()
        {
            CreateMap<Employee, EmployeeChanged>()
                .ForMember(dest => dest.EmployeeFullName, opt => opt.MapFrom(src => src.FullName)).ReverseMap();
        }
    }
}