using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Codes.Entities.Entities
{
    public class Representative:CommonPropertyEntity
    {
        public int RepresentativeCode { get; set; }
        [StringLength(20)]
        public string Phone { get; set; }
        [StringLength(20)]
        public string Mobile { get; set; }
        [StringLength(30)]
        public string Fax { get; set; }
        [StringLength(128)]
        public string ResponsibleFor { get; set; }
        [StringLength(256)]
        public string Address { get; set; }
        [StringLength(64)]
        public string Email { get; set; }
        public bool IsWorking { get; set; }
        [StringLength(128)]
        public string AccountCode { get; set; }
        [StringLength(128)]
        public string CostCenter { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Customer> Customers { get; set; }

    }
}
