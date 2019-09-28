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
        public virtual ICollection<User> Users  { get; set; }
    }
}
