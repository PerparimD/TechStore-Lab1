using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class StokuQmimiProduktit
{
    [Key]
    public int StokuID { get; set; }
    public int ProduktiId { get; set; }

    public int? SasiaNeStok { get; set; }

    public decimal? QmimiBleres { get; set; }

    public decimal? QmimiProduktit { get; set; }

    public DateTime? DataKrijimit { get; set; }

    public DateTime? DataPerditsimit { get; set; }
    [ForeignKey(nameof(ProduktiId))]
    public virtual Produkti? Produkti { get; set; }
}
