using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Tenets.Common.ServicesCommon.Transaction.Parameters
{
    public class CollectReceiptFilter
    {
        public Guid CustomerId { get; set; }
    }
}
