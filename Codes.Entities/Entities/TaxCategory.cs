using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Entities.Entities
{
    public class TaxCategory:CommonPropertyEntity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TaxType> TaxTypes { get; set; }
    }
}
