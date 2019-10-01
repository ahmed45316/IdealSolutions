using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Transactions.Services.Dto
{
    public class ClaimCustomerDto : IPrimaryKeyField<Guid?>
    {
        public Guid CustomerId { get; set; }
        public DateTime ClaimCustomerDate { get; set; }
        public string Notes { get; set; }
        public decimal Total { get; set; }
        public decimal Tax { get; set; }
        public decimal TotalAfterTax { get; set; }
        public Guid PolicyId { get; set; }
        public Guid? Id { get; set; }
    }
}
