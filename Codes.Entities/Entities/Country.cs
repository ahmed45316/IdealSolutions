using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Codes.Entities.Entities
{
    public class Country:CommonPropertyEntity
    {
        [StringLength(8)]
        public string CountryKey { get; set; }
        [StringLength(128)]
        public string NationalityAr { get; set; }
        [StringLength(128)]
        public string NationalityEn{ get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<City> Cities { get; set; }

    }
}
