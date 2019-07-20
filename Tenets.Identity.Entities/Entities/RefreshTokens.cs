using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using Tenets.Identity.Entities.Entities.Base;

namespace Tenets.Identity.Entities
{
    [Table("AspNetRefreshTokens")]
    public class RefreshToken : BaseClass
    {
        public DateTime IssuedUtc { get; set; }
        public DateTime ExpiresUtc { get; set; }
        [Required]
        [StringLength(450)]
        public string Token { get; set; }
        [StringLength(256)]
        public Guid UserId { get; set; }
        [ForeignKey("UserId")]
        public virtual User User { get; set; }
    }
}
