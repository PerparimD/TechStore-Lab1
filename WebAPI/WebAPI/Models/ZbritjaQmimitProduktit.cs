using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class ZbritjaQmimitProduktit
{
    [Key]
    public int ZbritjaID { get; set; }
    public int ProduktiId { get; set; }

    public decimal? QmimiPaZbritjeProduktit { get; set; } = 0;

    public decimal? QmimiMeZbritjeProduktit { get; set; } = 0;

    public DateTime? DataZbritjes { get; set; } = DateTime.Now;

    public DateTime? DataSkadimit { get; set; } = DateTime.Now;
    [ForeignKey(nameof(ProduktiId))]
    public virtual Produkti? Produkti { get; set; }
}
