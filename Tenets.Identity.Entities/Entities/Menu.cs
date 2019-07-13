using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenets.Identity.Entities
{
    public class Menu
    {      
        [Key]
        [StringLength(256)]
        public string Id { get; set; }
        [StringLength(256)]
        public string ScreenNameAr { get; set; }
        [StringLength(256)]
        public string ScreenNameEn { get; set; }
        [StringLength(256)]
        public string Href { get; set; }
        [StringLength(100)]
        public string Controller { get; set; }
        [StringLength(100)]
        public string Action { get; set; }
        [StringLength(50)]
        public string Parameters { get; set; }
        [StringLength(100)]
        public string Icon { get; set; }
        public bool IsStop { get; set; } = false;
        public int ItsOrder { get; set; }
        [StringLength(256)]
        public string ParentId { get; set; }
        [ForeignKey("ParentId")]
        public virtual Menu Parent { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Menu> Children { get; set; }
    }
}
