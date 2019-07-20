namespace Tenets.Identity.Entities
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using Tenets.Identity.Entities.Entities.Base;

    public class UsersRole:BaseClass
    {
        [Required]
        [StringLength(256)]
        public Guid RoleId { get; set; }
        [Required]
        [StringLength(256)]
        public Guid UserId { get; set; }
        [ForeignKey("RoleId")]
        public virtual Role Role { get; set; }
        [ForeignKey("UserId")]
        public virtual User User { get; set; }
    }
}
