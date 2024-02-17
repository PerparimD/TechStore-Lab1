using System.ComponentModel.DataAnnotations;

namespace WebAPI.Models
{
    public class Banka57449
    {
        [Key]
        public int Id57449 { get; set; }
        public string? Emri57449 { get; set; } = "";
        public virtual List<Personi57449>? Personi57449 { get; set; }
    }
}
