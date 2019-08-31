using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Common.Enums;

namespace Tenets.Common.ServicesCommon.Transaction.Interface
{
    public interface IOpeningBalanceDto : IPrimaryKeyField<Guid?>
    {
         OpeningBalanceType Type { get; set; }
         Guid TypeId { get; set; }
         DebitCredit DebitCridet { get; set; }
         decimal Value { get; set; }
         string Notes { get; set; }
         DateTime OpeningBlanceDate { get; set; }
    }
}
