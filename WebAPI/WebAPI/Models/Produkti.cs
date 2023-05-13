using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class Produkti
{
    public int ProduktiId { get; set; }

    public string? EmriProduktit { get; set; }

    public string? Pershkrimi { get; set; }

    public string? FotoProduktit { get; set; }

    public int? KompaniaId { get; set; }

    public int? KategoriaId { get; set; }

    public virtual KategoriaProduktit? Kategoria { get; set; }

    public virtual ICollection<KodiZbritje> KodiZbritjes { get; } = new List<KodiZbritje>();

    public virtual Kompanium? Kompania { get; set; }

    public virtual StokuQmimiProduktit? StokuQmimiProduktit { get; set; }

    public virtual ICollection<TeDhenatEporosi> TeDhenatEporosis { get; } = new List<TeDhenatEporosi>();

    public virtual ICollection<TeDhenatRegjistrimit> TeDhenatRegjistrimits { get; } = new List<TeDhenatRegjistrimit>();

    public virtual ZbritjaQmimitProduktit? ZbritjaQmimitProduktit { get; set; }
}
