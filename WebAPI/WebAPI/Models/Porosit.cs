using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class Porosit
{
    [Key]
    public int IdPorosia { get; set; }

    public decimal? TotaliPorosis { get; set; } = 0;

    public DateTime? DataPorosis { get; set; } = DateTime.Now;

    public string? StatusiPorosis { get; set; } = 'Ne Procesim';

    public int? IdKlienti { get; set; }

    public decimal? Zbritja { get; set; } = 0;
    public int? TotaliProdukteve { get; set; } = 0;
    [ForeignKey("IdKlienti")]
    public virtual Perdoruesi? Klienti { get; set; }

    public virtual List<TeDhenatEPorosis>? TeDhenatEPorosis { get; set; }
}
