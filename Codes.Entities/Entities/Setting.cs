using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Codes.Entities.Entities
{
    public class Setting: BaseEntity
    {
        [StringLength(128)]
        public string DatabaseAccount { get; set; }
        [StringLength(128)]
        public string RevenueAccount { get; set; }
        [StringLength(128)]
        public string FundAccount { get; set; }
        [StringLength(128)]
        public string BankAccount { get; set; }
        [StringLength(128)]
        public string JournalEntry { get; set; }
        [StringLength(128)]
        public string TransportCost { get; set; }
        public Guid TaxTypeId { get; set; }
        [ForeignKey("TaxTypeId")]
        public virtual TaxType TaxType { get; set; }
    }
}
