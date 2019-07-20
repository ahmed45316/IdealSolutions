namespace Tenets.Identity.Entities
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using Tenets.Identity.Entities.Entities.Base;

    public class Role : BaseClass
    {
        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UsersRole> UsersRole { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MenuRole> Menu { get; set; }
    }
}
