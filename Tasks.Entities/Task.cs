using System;
using System.ComponentModel.DataAnnotations;
using Tasks.Entities.Base;

namespace Tasks.Entities
{
    public class Task : BaseEntity
    {
        [Required]
        [MaxLength(128)]
        public string TaskName { get; set; }
        [Required]
        public Guid EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }
        public DateTime? DeadlineDate { get; set; }

    }
}
