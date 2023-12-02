using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class RegjistrimiStokut
{
    [Key]
    public int IdRegjistrimit { get; set; }

    public DateTime? DataRegjistrimit { get; set; }

    public int? StafiId { get; set; }

    public int? TotaliProdukteveRegjistruara { get; set; }

    public decimal? ShumaTotaleRegjistrimit { get; set; }

    public decimal? ShumaTotaleBlerese { get; set; }
    [ForeignKey(nameof(StafiId))]
    public virtual Perdoruesi? Stafi { get; set; }

    public virtual List<TeDhenatRegjistrimit>? TeDhenatRegjistrimit { get; set; }
}
