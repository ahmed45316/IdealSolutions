using System;
using BackendCore.Common.Core;

namespace BackendCore.Common.DTO.Employee
{
    public class EmployeeDto : IPrimaryKeyField<Guid?>
    {
        public Guid? Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string JobTitle { get; set; }
        public decimal? Salary { get; set; }
        public string Email { get; set; }
        public DateTime? BirthDate { get; set; }
    }
}
