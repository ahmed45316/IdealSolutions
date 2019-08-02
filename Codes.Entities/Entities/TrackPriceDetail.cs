using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Codes.Entities.Entities
{
    public class TrackPriceDetail:BaseEntity
    {
        public Guid TrackPriceId { get; set; }
        public Guid TrackSettingId { get; set; }
        [ForeignKey("TrackPriceId")]
        public virtual TrackPrice TrackPrice { get; set; }
        [ForeignKey("TrackSettingId")]
        public virtual TrackSetting TrackSetting { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TrackPriceDetailCarType> TrackPriceDetailCarTypes { get; set; }
    }
}
