using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Enums;

namespace Tenets.Common.ServicesCommon.Codes.Parameters
{
    public class OpeningBalanceParameters
    {
        public OpeningBalanceType Type { get; set; }
        public Guid TypeId { get; set; }
    }
}
