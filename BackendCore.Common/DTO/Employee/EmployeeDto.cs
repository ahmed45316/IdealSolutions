using System;
using System.ComponentModel.DataAnnotations;
using BackendCore.Common.Core;

namespace BackendCore.Common.DTO.Employee
{
    public class EmployeeDto : IPrimaryKeyField<Guid?>
    {
        public Guid? Id { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string JobTitle { get; set; }
        public decimal? Salary { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        public DateTime? BirthDate { get; set; }
    }
}
