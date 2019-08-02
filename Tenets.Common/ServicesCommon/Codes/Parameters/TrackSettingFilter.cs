using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.ServicesCommon.Codes.Parameters
{
    public class TrackSettingFilter
    {
        public Guid? FromTrackId { get; set; }
        public Guid? ToTrackId { get; set; }
    }
}
