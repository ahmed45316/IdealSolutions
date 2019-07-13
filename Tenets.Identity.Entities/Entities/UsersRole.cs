namespace Tenets.Identity.Entities
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class UsersRole
    {
        [Key]
        [StringLength(256)]
        public string Id { get; set; }
        [Required]
        [StringLength(256)]
        public string RoleId { get; set; }
        [Required]
        [StringLength(256)]
        public string UserId { get; set; }
        public bool IsDeleted { get; set; } = false;
        public bool IsBlock { get; set; } = false;
        [ForeignKey("RoleId")]
        public virtual Role Role { get; set; }
        [ForeignKey("UserId")]
        public virtual User User { get; set; }
    }
}
