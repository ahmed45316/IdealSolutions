using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Tenets.Common.ServicesCommon.Transaction.Parameters
{
    public class ClaimCustomerFilter
    {
        public Guid? CustomerId { get; set; }
        public Guid? CustomerCategoryId { get; set; }
        public Guid? InvoicTypeId { get; set; }
        [Required]
        public DateTime StartDate { get; set; }
        [Required]
        public DateTime EndDate { get; set; }

    }
}
