using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Transactions.Entities.Entities.Base;

namespace Transactions.Entities.Entites
{
    public class ClaimCustomerPolicy : BaseEntity
    {
        public Guid PolicyDetailId { get; set; }
        public decimal Value { get; set; }
        public Guid ClaimCustomerId { get; set; }
        [ForeignKey("PolicyDetailId")]
        public virtual PolicyDetail PolicyDetail { get; set; }
        [ForeignKey("ClaimCustomerId")]
        public virtual ClaimCustomer ClaimCustomer { get; set; }
    }
}
