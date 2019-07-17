using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.Core
{
    public interface ICommonProperty
    {
        string UserId { get; set; }
        DateTime? CreatedDate { get; set; }
        string UpdatedBy { get; set; }
        DateTime? UpdatedDate { get; set; }
    }
}
