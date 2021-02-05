using System.Threading.Tasks;
using BackendCore.Common.Core;
using BackendCore.Common.DTO.Employee;
using BackendCore.Common.FilterDto;
using Employee.Service.Services.Base;

namespace Employee.Service.Services.Employee
{
    public interface IEmployeeService : IBaseService<Entities.Employee, EmployeeDto>
    {
        Task<IResult> GetAllWithFilterAsync(EmployeeFilterDto filter);
    }
}
