using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class TeDhenatRegjistrimit
{
    public int IdRegjistrimit { get; set; }

    public int? IdProduktit { get; set; }

    public int? SasiaStokut { get; set; }

    public int? ShumaTotale { get; set; }

    public virtual Produkti? IdProduktitNavigation { get; set; }

    public virtual RegjistrimiStokut IdRegjistrimitNavigation { get; set; } = null!;
}
