using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Codes.Entities.Entities
{
    public class TrackSetting:BaseEntity
    {
        public Guid? FromTrackId { get; set; }
        public Guid? ToTrackId { get; set; }
        public double DistanceByKilloMeters { get; set; }
        public byte TrackSettingType { get; set; }
        public decimal? DriverMotivation { get; set; }
        [ForeignKey("FromTrackId")]
        public virtual Track FromTrack { get; set; }
        [ForeignKey("ToTrackId")]
        public virtual Track ToTrack { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TrackPriceDetail> TrackPriceDetails { get; set; }
    }
}
