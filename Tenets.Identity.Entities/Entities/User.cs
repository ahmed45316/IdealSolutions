namespace Tenets.Identity.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using Tenets.Identity.Entities.Entities.Base;

    public class User : BaseClass
    {
        [Required]
        [StringLength(256)]
        public string UserName { get; set; }
        public string Password { get; set; }
        [StringLength(256)]
        public string Email { get; set; }
        public string PhoneNumber { get; set; }      
        public Guid RoleId { get; set; }
        [ForeignKey("RoleId")]
        public virtual Role Role { get; set; }
        public Guid BranchId { get; set; }
    }
}
