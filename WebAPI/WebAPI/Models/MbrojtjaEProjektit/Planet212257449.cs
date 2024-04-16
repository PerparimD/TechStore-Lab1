using System.ComponentModel.DataAnnotations;

namespace WebAPI.Models.MbrojtjaEProjektit
{
    public class Planet212257449
    {
        [Key]
        public int PlanetId { get; set; }
        public string? Name { get; set; } = "";
        public string? Type { get; set; } = "";
        public string? isDeleted { get; set; } = "false";
    }
}
