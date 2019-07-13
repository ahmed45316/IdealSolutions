namespace Tenets.Identity.Entities
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class UserLogin
    {
        [Key]
        [StringLength(256)]
        [Column(Order = 0)]
        public string Id { get; set; }
        [StringLength(256)]
        [Column(Order = 1)]
        public string LoginProvider { get; set; }
        [StringLength(256)]
        [Column(Order = 2)]
        public string ProviderKey { get; set; }
        [StringLength(256)]
        [Column(Order = 3)]
        public string UserId { get; set; }
        public bool IsDeleted { get; set; } = false;
        public bool IsBlock { get; set; } = false;
        [ForeignKey("UserId")]
        public virtual User User { get; set; }
    }
}
