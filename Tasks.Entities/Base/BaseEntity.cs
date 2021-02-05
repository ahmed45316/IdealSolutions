using System;

namespace Tasks.Entities.Base
{
    public class BaseEntity
    {
        public Guid Id { get; set; }
        public DateTime? CreatedDate { get; set; } = DateTime.Now;
        public bool IsDeleted { get; set; } = false;
    }
}