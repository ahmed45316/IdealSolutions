using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class TrackPriceDto : ITrackPriceDto
    {
        public Guid CustomerId { get ; set ; }
        public Guid? FromTrackId { get ; set ; }
        public Guid? ToTrackId { get ; set ; }
        public Guid Id { get ; set ; }
    }
}
