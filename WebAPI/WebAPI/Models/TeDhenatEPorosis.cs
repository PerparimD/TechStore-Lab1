
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class TeDhenatEPorosis
{
    [Key]
    public int IdDetajet { get; set; }

    public decimal? QmimiTotal { get; set; }

    public int? SasiaPorositur { get; set; }

    public int? IdPorosia { get; set; }

    public int? IdProdukti { get; set; }
    public decimal? QmimiProduktit { get; set; }

    [ForeignKey(nameof(IdPorosia))]
    public virtual Porosit? Porosia { get; set; }
    [ForeignKey(nameof(IdProdukti))]
    public virtual Produkti? Produkti { get; set; }

}
