using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tenets.Identity.Entities
{
   public class MenuRole
    {
        [Key]
        [StringLength(256)]
        public string Id { get; set; }
        [StringLength(256)]
        public string RoleId { get; set; }
        [StringLength(256)]
        public string MenuId { get; set; }
        [ForeignKey("RoleId")]
        public virtual Role Role { get; set; }
        [ForeignKey("MenuId")]
        public virtual Menu Menu { get; set; }

    }
}
