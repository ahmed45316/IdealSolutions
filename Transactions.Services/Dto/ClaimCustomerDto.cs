using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Transaction.Interface;

namespace Transactions.Services.Dto
{
    public class ClaimCustomerDto : IClaimCustomerDto
    {
        public Guid CustomerId { get; set; }
        public DateTime ClaimCustomerDate { get; set; }
        public string Notes { get; set; }
        public decimal Total { get; set; }
        public decimal Tax { get; set; }
        public decimal TotalAfterTax { get; set; }
        public Guid? Id { get; set; }
    }
}
