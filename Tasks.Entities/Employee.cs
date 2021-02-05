using System.Collections.Generic;
using System.Collections.ObjectModel;
using Tasks.Entities.Base;

namespace Tasks.Entities
{
    public class Employee : BaseEntity
    {
        public string FullName { get; set; }
        public virtual ICollection<Task> Tasks { get; set; } = new Collection<Task>();
    }
}
