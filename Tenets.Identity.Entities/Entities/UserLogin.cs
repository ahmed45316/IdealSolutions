namespace Tenets.Identity.Entities
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using Tenets.Identity.Entities.Entities.Base;

    public class UserLogin:BaseClass
    {
        [StringLength(256)]
        [Column(Order = 1)]
        public string LoginProvider { get; set; }
        [StringLength(256)]
        [Column(Order = 2)]
        public string ProviderKey { get; set; }
        [StringLength(256)]
        [Column(Order = 3)]
        public Guid UserId { get; set; }
        [ForeignKey("UserId")]
        public virtual User User { get; set; }
    }
}
