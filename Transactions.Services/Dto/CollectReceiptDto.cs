using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Enums;
using Tenets.Common.ServicesCommon.Transaction.Interface;

namespace Transactions.Services.Dto
{
    public class CollectReceiptDto : ICollectReceiptDto
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
        public Guid PolicyDetailId { get; set; }
        public Guid? Id { get; set; }
    }
}
