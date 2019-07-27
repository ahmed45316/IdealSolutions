using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Codes.Entities.Entities
{
    public class TrackPrice:BaseEntity
    {
        public Guid CustomerId { get; set; }
        [ForeignKey("CustomerId")]
        public virtual Customer Customer { get; set; }
        public Guid? FromTrackId { get; set; }
        [ForeignKey("FromTrackId")]
        public virtual Track FromTrack { get; set; }
        public Guid? ToTrackId { get; set; }
        [ForeignKey("ToTrackId")]
        public virtual Track ToTrack { get; set; }

    }
}
