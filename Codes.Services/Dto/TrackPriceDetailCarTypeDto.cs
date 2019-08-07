using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class TrackPriceDetailCarTypeDto
    {
        public Guid? TrackPriceDetailId { get; set; }
        public Guid CarTypeId { get; set; }
        public string CarNameAr { get; set; }
        public string CarNameEn { get; set; }
        public double CarTypePrice { get; set; }
        public Guid? Id { get; set; }
    }
}
