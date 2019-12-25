using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Transactions.Entities.Entities
{
    public class Customer
    {
        [Key]
        public Guid Id { get; set; }
        [StringLength(128)]
        public string NameAr { get; set; }
        [StringLength(128)]
        public string NameEn { get; set; }

        public virtual  ICollection<Policy> Policies { get; set; }
        public virtual ICollection<ClaimCustomer> ClaimCustomers { get; set; }
        public virtual ICollection<CollectReceipt> CollectReceipts { get; set; }
        public virtual ICollection<OpeningBalance> OpeningBalances { get; set; }


    }
}
