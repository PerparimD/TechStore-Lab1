using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebAPI.Models;

public partial class Kompania
{
    [Key]
    public int KompaniaId { get; set; }

    public string? EmriKompanis { get; set; }

    public string? Logo { get; set; }

    public string? Adresa { get; set; }
    public virtual List<Produkti>? Produkti { get; set; }
}
