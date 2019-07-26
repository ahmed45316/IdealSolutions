using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Entities.Entities
{
    public class Company :CommonPropertyEntity
    {
        [StringLength(128)]
        public string TaxNumber { get; set; }
        [StringLength(256)]
        public string Address { get; set; }
        [StringLength(128)]
        public string Logo { get; set; }
        [StringLength(128)]
        public string CompanyGeneralLadgerId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Branch> Branches { get; set; }
    }
}
