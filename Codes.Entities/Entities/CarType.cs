using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Entities.Entities
{
    public class CarType:CommonPropertyEntity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TrackPriceDetailCarType> TrackPriceDetailCarTypes { get; set; }
    }
}
