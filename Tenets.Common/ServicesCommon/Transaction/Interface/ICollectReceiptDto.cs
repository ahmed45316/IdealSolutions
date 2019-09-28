using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Common.Enums;

namespace Tenets.Common.ServicesCommon.Transaction.Interface
{
    public interface ICollectReceiptDto : IPrimaryKeyField<Guid?>
    {
         Guid CustomerId { get; set; }
         DateTime CollectReceiptDate { get; set; }
         DateTime? CollectReceiptDateHegry { get; set; }
         string Notes { get; set; }
         string CollectReceiptNumber { get; set; }
         decimal Paid { get; set; }
         PaymentType PaymentType { get; set; }
         string AccountCode { get; set; }
         string CostCenter { get; set; }
         CollectReceiptType CollectReceiptType { get; set; }
         Guid PolicyDetailId { get; set; }
    }
}
