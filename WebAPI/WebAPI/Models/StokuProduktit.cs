using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class StokuProduktit
{
    public int ProduktiId { get; set; }

    public int? SasiaNeStok { get; set; }

    public DateTime? DataKrijimit { get; set; }

    public DateTime? DataPerditsimit { get; set; }

    public virtual Produkti Produkti { get; set; } = null!;
}
