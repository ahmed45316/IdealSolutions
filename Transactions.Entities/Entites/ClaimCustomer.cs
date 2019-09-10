using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Transactions.Entities.Entities.Base;

namespace Transactions.Entities.Entites
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
        public Guid PolicyDetailId { get; set; }
        [ForeignKey("PolicyDetailId")]
        public virtual PolicyDetail PolicyDetail { get; set; }
    }
}
