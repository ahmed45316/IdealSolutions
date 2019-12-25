using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Tenets.Common.Enums;
using Transactions.Entities.Entities.Base;

namespace Transactions.Entities.Entities
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
        public Guid PolicyId { get; set; }
        [ForeignKey("PolicyId")]
        public virtual Policy Policy { get; set; }
        [ForeignKey("CustomerId")]
        public virtual Customer Customer { get; set; }
    }
}
