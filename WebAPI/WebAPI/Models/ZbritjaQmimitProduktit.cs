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

    public decimal? QmimiPaZbritjeProduktit { get; set; }

    public decimal? QmimiMeZbritjeProduktit { get; set; }

    public DateTime? DataZbritjes { get; set; }

    public DateTime? DataSkadimit { get; set; }
    [ForeignKey(nameof(ProduktiId))]
    public virtual Produkti? Produkti { get; set; }
}
