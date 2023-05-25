using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class TeDhenatEporosi
{
    public int IdDetajet { get; set; }

    public decimal? QmimiTotal { get; set; }

    public int? SasiaPorositur { get; set; }

    public int? IdPorosia { get; set; }

    public int? IdProdukti { get; set; }
    public decimal? QmimiProduktit { get; set; }

    public virtual Porosit? IdPorosiaNavigation { get; set; }

    public virtual Produkti? IdProduktiNavigation { get; set; }

}
