using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ITrackPriceDto : IPrimaryKeyField<Guid?>
    {
        Guid CustomerId { get; set; }
        DateTime? FromDate { get; set; }
        DateTime? ToDate { get; set; }
        decimal? OverNightPrice { get; set; }
        decimal? TownPrice { get; set; }
        decimal? RecallPrice { get; set; }
    }
}
