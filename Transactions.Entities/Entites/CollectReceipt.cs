using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Tenets.Common.Enums;
using Transactions.Entities.Entities.Base;

namespace Transactions.Entities.Entites
{
    public class CollectReceipt : BaseEntity
    {
        public Guid CustomerId { get; set; }
        public DateTime CollectReceiptDate { get; set; }
        public DateTime? CollectReceiptDateHegry { get; set; }
        [StringLength(512)]
        public string Notes { get; set; }
        public string CollectReceiptNumber { get; set; }
        public decimal Paid { get; set; }
        public PaymentType PaymentType { get; set; }
        [StringLength(128)]
        public string AccountCode { get; set; }
        [StringLength(128)]
        public string CostCenter { get; set; }
        public CollectReceiptType CollectReceiptType { get; set; }
        public Guid PolicyDetailId { get; set; }
        [ForeignKey("PolicyDetailId")]
        public virtual PolicyDetail PolicyDetail { get; set; }
    }
}
