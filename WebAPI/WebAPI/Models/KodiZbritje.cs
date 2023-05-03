using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class KodiZbritje
{
    public string Kodi { get; set; } = null!;

    public DateTime? DataKrijimit { get; set; }

    public decimal? QmimiZbritjes { get; set; }

    public int? IdProdukti { get; set; }

    public virtual Produkti? IdProduktiNavigation { get; set; }

    public virtual ICollection<TeDhenatEporosi> TeDhenatEporosis { get; } = new List<TeDhenatEporosi>();
}
