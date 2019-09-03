using System;
using System.Collections.Generic;
using System.Text;

namespace Transactions.Services.Dto
{
    public class ClaimCustomerPolicyDto
    {
        public Guid? Id { get; set; }
        public Guid PolicyDetailId { get; set; }
        public decimal Value { get; set; }
        public Guid ClaimCustomerId { get; set; }
    }
}
