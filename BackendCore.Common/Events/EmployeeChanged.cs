using System;

namespace BackendCore.Common.Events
{
    public class EmployeeChanged
    {
        public Guid Id { get; set; }
        public string EmployeeFullName { get; set; }
    }
}
