using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ITrackPriceDetailCarTypeDto : IPrimaryKeyField<Guid?>
    {
        Guid? TrackPriceDetailId { get; set; }
        Guid CarTypeId { get; set; }
        string CarNameAr { get; set; }
        string CarNameEn { get; set; }
        double CarTypePrice { get; set; }
    }
}
