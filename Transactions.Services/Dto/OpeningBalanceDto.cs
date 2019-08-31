using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Enums;
using Tenets.Common.ServicesCommon.Transaction.Interface;

namespace Transactions.Services.Dto
{
    public class OpeningBalanceDto : IOpeningBalanceDto
    {
        public OpeningBalanceType Type { get ; set ; }
        public Guid TypeId { get ; set ; }
        public DebitCredit DebitCridet { get ; set ; }
        public decimal Value { get ; set ; }
        public string Notes { get ; set ; }
        public DateTime OpeningBlanceDate { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
