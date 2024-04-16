using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models
{
    public class Player
    {
        [Key]
        public int PlayerId { get; set; }
        public string? Name { get; set; }
        public int? Number { get; set; }
        public int? BirthYear { get; set; }
        public int? TeamId { get; set; }

        [ForeignKey(nameof(TeamId))]
        public virtual Team? Team { get; set; }
    }
}
