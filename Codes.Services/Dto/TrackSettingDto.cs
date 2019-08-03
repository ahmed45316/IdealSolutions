using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class TrackSettingDto : ITrackSettingDto
    {
        public Guid? FromTrackId { get; set; }
        public Guid? ToTrackId { get; set; }
        public double DistanceByKilloMeters { get; set; }
        public byte TrackSettingType { get; set; }
        public decimal? DriverMotivation { get; set; }
        public Guid? Id { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
    }
}
