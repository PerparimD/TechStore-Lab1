using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class RegjistrimiStokut
{
    public int IdRegjistrimit { get; set; }

    public DateTime? DataRegjistrimit { get; set; }

    public int? StafiId { get; set; }

    public decimal? ShumaTotaleRegjistrimit { get; set; }

    public int? TotaliProdukteveRegjistruara { get; set; }

    public virtual Perdoruesi? Stafi { get; set; }
}
