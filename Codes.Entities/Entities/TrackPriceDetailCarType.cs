using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Codes.Entities.Entities
{
    public class TrackPriceDetailCarType:BaseEntity
    {
        public Guid TrackPriceDetailId { get; set; }
        public Guid CarTypeId { get; set; }
        public double CarTypePrice { get; set; }
        [ForeignKey("TrackPriceDetailId")]
        public virtual TrackPriceDetail TrackPriceDetail { get; set; }
        [ForeignKey("CarTypeId")]
        public virtual CarType CarType { get; set; }
    }
}
