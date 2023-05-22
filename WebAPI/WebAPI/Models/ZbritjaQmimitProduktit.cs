using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class ZbritjaQmimitProduktit
{
    public int ProduktiId { get; set; }

    public decimal? QmimiPaZbritjeProduktit { get; set; }

    public decimal? QmimiMeZbritjeProduktit { get; set; }

    public DateTime? DataZbritjes { get; set; }

    public DateTime? DataSkadimit { get; set; }

    public virtual Produkti Produkti { get; set; } = null!;
}
