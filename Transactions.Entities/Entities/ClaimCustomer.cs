using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Transactions.Entities.Entities.Base;

namespace Transactions.Entities.Entities
{
    public class ClaimCustomer : BaseEntity
    {
        public Guid CustomerId { get; set; }
        public DateTime ClaimCustomerDate { get; set; }
        [StringLength(512)]
        public string Notes { get; set; }
        public decimal Total { get; set; }
        public decimal Tax { get; set; }
        public decimal TotalAfterTax { get; set; }
        public Guid PolicyId { get; set; }
        [ForeignKey("PolicyId")]
        public virtual Policy Policy { get; set; }
        [ForeignKey("CustomerId")]
        public virtual Customer Customer { get; set; }
    }
}
