using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class Produkti
{
    [Key]
    public int ProduktiId { get; set; }

    public string? EmriProduktit { get; set; } = "";

    public string? Pershkrimi { get; set; } = "";

    public string? FotoProduktit { get; set; } = "produktPaFoto.png";

    public int? KompaniaId { get; set; }

    public int? KategoriaId { get; set; }
    [ForeignKey(nameof(KategoriaId))]
    public virtual KategoriaProduktit? Kategoria { get; set; }
    [ForeignKey(nameof(KompaniaId))]
    public virtual Kompania? Kompania { get; set; }

    public virtual List<KodiZbritjes>? KodiZbritjes { get; set; }

    public virtual StokuQmimiProduktit? StokuQmimiProduktit { get; set; }

    public virtual List<TeDhenatEPorosis>? TeDhenatEPorosis { get; set; }

    public virtual List<TeDhenatRegjistrimit>? TeDhenatRegjistrimit { get; set; }

    public virtual ZbritjaQmimitProduktit? ZbritjaQmimitProduktit { get; set; }
}
