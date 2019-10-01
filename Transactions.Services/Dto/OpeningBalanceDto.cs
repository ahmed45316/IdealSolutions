using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Common.Enums;

namespace Transactions.Services.Dto
{
    public class OpeningBalanceDto : IPrimaryKeyField<Guid?>
    {
        public OpeningBalanceType Type { get; set; }
        public Guid TypeId { get; set; }
        public DebitCredit DebitCridet { get; set; }
        public decimal Value { get; set; }
        public string Notes { get; set; }
        public DateTime OpeningBlanceDate { get; set; }
        public Guid? Id { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public string DebitCridetNameAr { get; set; }
        public string DebitCridetNameEn { get; set; }
    }
}
