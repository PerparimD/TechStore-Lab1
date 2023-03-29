using System;
using System.Collections.Generic;

namespace TechStoreWebAPI.Models;

public partial class Kompanium
{
    public int KompaniaId { get; set; }

    public string EmriKompanis { get; set; } = null!;

    public string? Logo { get; set; }

    public string? Adresa { get; set; }

    public virtual ICollection<Produkti> Produktis { get; } = new List<Produkti>();
}
