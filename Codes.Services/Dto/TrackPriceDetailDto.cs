using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class TrackPriceDetailDto : ITrackPriceDetailDto
    {
        public Guid? TrackPriceId { get ; set ; }
        public Guid TrackSettingId { get ; set ; }
        public Guid? Id { get ; set ; }
        public List<object> TrackPriceDetailCarTypes { get; set; }
    }
}
