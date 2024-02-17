using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class RegjistrimiStokut
{
    [Key]
    public int IdRegjistrimit { get; set; }

    public DateTime? DataRegjistrimit { get; set; } = DateTime.Now();

    public int? StafiId { get; set; }

    public int? TotaliProdukteveRegjistruara { get; set; } = 0;

    public decimal? ShumaTotaleRegjistrimit { get; set; } = 0;

    public decimal? ShumaTotaleBlerese { get; set; } = 0;
    [ForeignKey(nameof(StafiId))]
    public virtual Perdoruesi? Stafi { get; set; }

    public virtual List<TeDhenatRegjistrimit>? TeDhenatRegjistrimit { get; set; }
}
