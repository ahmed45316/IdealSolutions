using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ITrackPriceDetailDto<T>:IPrimaryKeyField<Guid?>
    {
         Guid? TrackPriceId { get; set; }
         Guid TrackSettingId { get; set; }
         List<T> TrackPriceDetailCarTypes { get; set; }
    }
}
