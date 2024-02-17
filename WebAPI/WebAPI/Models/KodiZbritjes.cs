using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class KodiZbritjes
{
    [Key]
    public string Kodi { get; set; } = null!;

    public DateTime? DataKrijimit { get; set; } = DateTime.Now;

    public decimal? QmimiZbritjes { get; set; } = 0;

    public int? IdProdukti { get; set; }

    [ForeignKey("IdProdukti")]
    public virtual Produkti? Produkti { get; set; }

}
