using System;
using System.Collections.Generic;

namespace TechStoreWebAPI.Models;

public partial class Porosit
{
    public int IdPorosia { get; set; }

    public decimal TotaliPorosis { get; set; }

    public DateTime? DataPorosis { get; set; }

    public string? StatusiPorosis { get; set; }

    public int? IdKlienti { get; set; }

    public virtual Perdoruesi? IdKlientiNavigation { get; set; }

    public virtual ICollection<TeDhenatEporosi> TeDhenatEporosis { get; } = new List<TeDhenatEporosi>();
}
