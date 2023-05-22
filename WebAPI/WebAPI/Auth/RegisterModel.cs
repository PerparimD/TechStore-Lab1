using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Security.Policy;

namespace WebAPI.Auth
{
    public class RegisterModel
    {
        [Required(ErrorMessage = " Name is required")]
        public string Name { get; set; }
        [Required(ErrorMessage = " Name is required")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Username is required")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }

        public string? Adresa { get; set; }
        public string? Qyteti { get; set; }
        public string? Shteti { get; set; }
        public int? ZipKodi { get; set; }
        public string? NrTelefonit { get; set; }
    }
}
