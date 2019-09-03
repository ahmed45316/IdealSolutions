using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        public virtual ICollection<ClaimCustomerPolicy> ClaimCustomerPolicies { get; set; }

    }
}
