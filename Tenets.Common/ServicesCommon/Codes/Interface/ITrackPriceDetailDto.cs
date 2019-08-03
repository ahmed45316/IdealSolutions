using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ITrackPriceDetailDto:IPrimaryKeyField<Guid?>
    {
         Guid? TrackPriceId { get; set; }
         Guid TrackSettingId { get; set; }
    }
}
