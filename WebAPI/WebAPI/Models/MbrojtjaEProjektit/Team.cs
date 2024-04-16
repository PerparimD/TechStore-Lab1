using System.ComponentModel.DataAnnotations;

namespace WebAPI.Models
{
    public class Team
    {
        [Key]
        public int TeamId { get; set; }
        public string? Name { get; set; } = "";
    }
}
