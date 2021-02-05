using AutoMapper;
using BackendCore.Common.DTO.Employee;

namespace Employee.Service.Mapping
{
    public partial class MappingService : Profile
    {
        public MappingService()
        {
            MapEmployee();
        }
        public void MapEmployee()
        {
            CreateMap<EmployeeDto, Entities.Employee>().ReverseMap();
        }
    }
}