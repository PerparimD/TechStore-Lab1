using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class TeDhenatRegjistrimit
{
    [Key]
    public int Id { get; set; }

    public int? IdRegjistrimit { get; set; }

    public int? IdProduktit { get; set; }

    public int? SasiaStokut { get; set; } = 0;

    public decimal? QmimiBleres { get; set; } = 0;

    public decimal? QmimiShites { get; set; } = 0;
    [ForeignKey(nameof(IdProduktit))]
    public virtual Produkti? Produkti { get; set; }
    [ForeignKey(nameof(IdRegjistrimit))]
    public virtual RegjistrimiStokut? Regjistrimi { get; set; }
}
