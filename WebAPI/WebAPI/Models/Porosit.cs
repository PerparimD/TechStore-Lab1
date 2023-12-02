using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class Porosit
{
    [Key]
    public int IdPorosia { get; set; }

    public decimal? TotaliPorosis { get; set; }

    public DateTime? DataPorosis { get; set; }

    public string? StatusiPorosis { get; set; }

    public int? IdKlienti { get; set; }

    public decimal? Zbritja { get; set; }
    public int? TotaliProdukteve { get; set; }
    [ForeignKey("IdKlienti")]
    public virtual Perdoruesi? Klienti { get; set; }

    public virtual List<TeDhenatEPorosis>? TeDhenatEPorosis { get; set; }
}
