using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Transaction.Interface
{
    public interface IClaimCustomerDto : IPrimaryKeyField<Guid?>
    {
         Guid CustomerId { get; set; }
         DateTime ClaimCustomerDate { get; set; }
         string Notes { get; set; }
         decimal Total { get; set; }
         decimal Tax { get; set; }
         decimal TotalAfterTax { get; set; }
         Guid PolicyDetailId { get; set; }
    }
}
