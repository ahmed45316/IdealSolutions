using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Common.Enums;

namespace Transactions.Services.Dto
{
    public class CollectReceiptDto : IPrimaryKeyField<Guid?>
    {
        public Guid CustomerId { get; set; }
        public DateTime CollectReceiptDate { get; set; }
        public DateTime? CollectReceiptDateHegry { get; set; }
        public string Notes { get; set; }
        public string CollectReceiptNumber { get; set; }
        public decimal Paid { get; set; }
        public PaymentType PaymentType { get; set; }
        public string AccountCode { get; set; }
        public string CostCenter { get; set; }
        public CollectReceiptType CollectReceiptType { get; set; }
        public Guid PolicyId { get; set; }
        public Guid? Id { get; set; }
    }
}
