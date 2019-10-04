using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Services.Dto
{
    public class TrackPriceDetailDto 
    {
        public Guid? TrackPriceId { get ; set ; }
        public Guid TrackSettingId { get ; set ; }
        public string TrackSettingNameAr { get; set; }
        public string TrackSettingNameEn { get; set; }
        public Guid? Id { get ; set ; }
        public List<TrackPriceDetailCarTypeDto> TrackPriceDetailCarTypes { get; set; }
    }
}
