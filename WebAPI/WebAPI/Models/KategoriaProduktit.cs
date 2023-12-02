using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebAPI.Models;

public partial class KategoriaProduktit
{
    [Key]
    public int KategoriaId { get; set; }

    public string? LlojiKategoris { get; set; }

    public string? PershkrimiKategoris { get; set; }

    public virtual List<Produkti>? Produkti { get; set; }
}
