namespace Tenets.Identity.Entities
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class UserClaim
    {
        [Key]
        [StringLength(256)]
        public string Id { get; set; }
        [Required]
        [StringLength(256)]
        public string UserId { get; set; }
        [StringLength(256)]
        public string ClaimType { get; set; }
        [StringLength(256)]
        public string ClaimValue { get; set; }
        public bool IsDeleted { get; set; } = false;
        public bool IsBlock { get; set; } = false;
        [ForeignKey("UserId")]
        public virtual User User { get; set; }
    }
}
