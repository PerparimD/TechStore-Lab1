using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class TeDhenatRegjistrimit
{
    public int Id { get; set; }

    public int? IdRegjistrimit { get; set; }

    public int? IdProduktit { get; set; }

    public int? SasiaStokut { get; set; }

    public decimal? QmimiBleres { get; set; }

    public decimal? QmimiShites { get; set; }

    public int? ShumaTotale { get; set; }

    public virtual Produkti? IdProduktitNavigation { get; set; }

    public virtual RegjistrimiStokut? IdRegjistrimitNavigation { get; set; }
}
