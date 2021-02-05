using System;
using System.ComponentModel.DataAnnotations;
using Employee.Entities.Base;

namespace Employee.Entities
{
    public class Employee : BaseEntity
    {
        [Required]
        [MaxLength(64)]
        public string FirstName { get; set; }
        [Required]
        [MaxLength(64)]
        public string LastName { get; set; }
        [Required]
        [MaxLength(128)]
        public string JobTitle { get; set; }
        public decimal? Salary { get; set; } 
        [Required]
        [MaxLength(64)]
        public string Email { get; set; }
        public DateTime? BirthDate { get; set; }


    }
}
