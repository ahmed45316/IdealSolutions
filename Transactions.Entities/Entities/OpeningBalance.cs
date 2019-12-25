using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Tenets.Common.Enums;
using Transactions.Entities.Entities.Base;

namespace Transactions.Entities.Entities
{
    public class OpeningBalance : BaseEntity
    {
        public OpeningBalanceType Type { get; set; }
        public Guid TypeId { get; set; }
        public DebitCredit DebitCridet { get; set; }
        public decimal Value { get; set; }
        [StringLength(512)]
        public string Notes { get; set; }
        public DateTime OpeningBlanceDate { get; set; }
        [ForeignKey("CustomerId")]
        public virtual Customer Customer { get; set; }
    }
}
