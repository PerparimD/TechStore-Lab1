using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class StokuQmimiProduktit
{
    public int ProduktiId { get; set; }

    public int? SasiaNeStok { get; set; }

    public decimal? QmimiBleres { get; set; }

    public decimal? QmimiProduktit { get; set; }

    public DateTime? DataKrijimit { get; set; }

    public DateTime? DataPerditsimit { get; set; }

}
