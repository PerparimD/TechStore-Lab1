using System;
using System.Collections.Generic;

namespace TechStoreWebAPI.Models;

public partial class TeDhenatEporosi
{
    public int IdDetajet { get; set; }

    public decimal QmimiTotal { get; set; }

    public int SasiaPorositur { get; set; }

    public int IdPorosia { get; set; }

    public int? IdProdukti { get; set; }

    public string? KodiZbritjes { get; set; }

    public virtual Porosit IdPorosiaNavigation { get; set; } = null!;

    public virtual Produkti? IdProduktiNavigation { get; set; }

    public virtual KodiZbritje? KodiZbritjesNavigation { get; set; }
}
