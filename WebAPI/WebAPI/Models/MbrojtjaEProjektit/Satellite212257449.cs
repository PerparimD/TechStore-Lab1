using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models.MbrojtjaEProjektit
{
    public class Satellite212257449
    {
        [Key]
        public int SatelliteId { get; set; }
        public string? Name { get; set; } = "";
        public string? isDeleted { get; set; } = "false";
        public int? PlanetId { get; set; }
        [ForeignKey(nameof(PlanetId))]
        public virtual Planet212257449? Planet { get; set; }
    }
}
