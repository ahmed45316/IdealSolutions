using BackendCore.Common.DTO.Employee;
using Employee.Service.Services.Base;

namespace Employee.Service.Services.Employee
{
    public class EmployeeService : BaseService<Entities.Employee, EmployeeDto>, IEmployeeService
    {
        public EmployeeService(IServiceBaseParameter<Entities.Employee> parameters) : base(parameters)
        {
        }

    }
}
