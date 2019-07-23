using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.ServicesCommon.Identity.Parameters
{
   public  class ScreensAssignedParameters
    {
        public Guid RoleId { get; set; }
        public Guid[] ScreenAssigned { get; set; }
        public Guid[] ScreenAssignedRemove { get; set; }
    }
}
