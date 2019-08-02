using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ITrackSettingDto: IPrimaryKeyField<Guid?>
    {
         Guid? FromTrackId { get; set; }
         Guid? ToTrackId { get; set; }
         double DistanceByKilloMeters { get; set; }
         byte TrackSettingType { get; set; }
         decimal? DriverMotivation { get; set; }
    }
}
