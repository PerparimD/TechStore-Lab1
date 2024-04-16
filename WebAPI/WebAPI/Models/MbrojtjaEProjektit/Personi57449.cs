using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models.MbrojtjaEProjektit
{
    public class Personi57449
    {
        [Key]
        public int Id57449 { get; set; }
        public string? Emri57449 { get; set; }
        public string? Mbiemri57449 { get; set; }
        public int? Banka57449ID { get; set; }

        [ForeignKey(nameof(Banka57449ID))]
        public virtual Banka57449? Banka57449 { get; set; }
    }
}
