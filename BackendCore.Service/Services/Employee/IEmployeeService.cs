using BackendCore.Common.DTO.Employee;
using Employee.Service.Services.Base;

namespace Employee.Service.Services.Employee
{
    public interface IEmployeeService : IBaseService<Entities.Employee, EmployeeDto>
    {
    }
}
