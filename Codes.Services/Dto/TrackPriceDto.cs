using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class TrackPriceDto:IPrimaryKeyField<Guid?>
    {
        public Guid CustomerId { get; set; }
        public string CustomerNameAr { get; set; }
        public string CustomerNameEn { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public decimal? OverNightPrice { get; set; }
        public decimal? TownPrice { get; set; }
        public decimal? RecallPrice { get; set; }
        public Guid? Id { get ; set ; }
        public List<TrackPriceDetailDto> TrackPriceDetails { get; set; }
    }
}
