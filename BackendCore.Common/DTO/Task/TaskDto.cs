using System;
using System.ComponentModel.DataAnnotations;
using BackendCore.Common.Core;

namespace BackendCore.Common.DTO.Task
{
    public class TaskDto : IPrimaryKeyField<Guid?>
    {
        public Guid? Id { get; set; }
        [Required]
        public string TaskName { get; set; }
        [Required]
        public Guid EmployeeId { get; set; }
        public string FullEmployeeName { get; set; }
        public DateTime? DeadlineDate { get; set; }
    }
}
