using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.ServicesCommon.Identity.Parameters
{
    public class AssignUserOnRoleParameters
    {
        public Guid RoleId { get; set; }
        public Guid[] AssignedUser { get; set; }
    }
}
