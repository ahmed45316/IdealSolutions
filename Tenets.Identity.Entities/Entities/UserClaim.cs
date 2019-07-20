namespace Tenets.Identity.Entities
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using Tenets.Identity.Entities.Entities.Base;

    public class UserClaim:BaseClass
    {
        [Required]
        [StringLength(256)]
        public Guid UserId { get; set; }
        [StringLength(256)]
        public string ClaimType { get; set; }
        [StringLength(256)]
        public string ClaimValue { get; set; }

        [ForeignKey("UserId")]
        public virtual User User { get; set; }
    }
}
