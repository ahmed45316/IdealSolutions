using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Enums;
using Tenets.Common.ServicesCommon.Base;

namespace Tenets.Common.ServicesCommon.Transaction.Parameters
{
   public class OpeningBalanceFilter
    {
        public DateTime? OpeningBalanceFilterDate { get; set; }
        public OpeningBalanceType? Type { get; set; }
        public Guid? TypeId { get; set; }
    }
}
