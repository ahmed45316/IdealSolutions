using System.ComponentModel.DataAnnotations;

namespace Tenets.Common.ServicesCommon.Identity.Parameters
{
    public class LoginParameters
    {
        [Required]
        public string Username { get; set; }
        [Required]
        public string Password { get; set; }
    }
}
