using System.ComponentModel.DataAnnotations;

namespace Tenets.Common.Identity.Parameters
{
    public class LoginParameters
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
        public bool IsSavedPassword { get; set; }
    }
}
