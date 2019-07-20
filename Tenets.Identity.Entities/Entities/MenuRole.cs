using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tenets.Identity.Entities.Entities.Base;

namespace Tenets.Identity.Entities
{
   public class MenuRole : BaseClass
    {
        [StringLength(256)]
        public Guid RoleId { get; set; }
        [StringLength(256)]
        public Guid MenuId { get; set; }
        [ForeignKey("RoleId")]
        public virtual Role Role { get; set; }
        [ForeignKey("MenuId")]
        public virtual Menu Menu { get; set; }

    }
}
