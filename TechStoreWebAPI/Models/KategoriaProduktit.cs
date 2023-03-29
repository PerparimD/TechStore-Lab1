using System;
using System.Collections.Generic;

namespace TechStoreWebAPI.Models;

public partial class KategoriaProduktit
{
    public int KategoriaId { get; set; }

    public string LlojiKategoris { get; set; } = null!;

    public string? PershkrimiKategoris { get; set; }

    public virtual ICollection<Produkti> Produktis { get; } = new List<Produkti>();
}
