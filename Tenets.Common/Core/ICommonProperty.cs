using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.Core
{
    public interface ICommonProperty
    {
         Guid CreateUserId { get; set; }
         DateTime CreateDate { get; set; }
         Guid? ModifyUserId { get; set; }
         DateTime? ModifyDate { get; set; }
    }
}
