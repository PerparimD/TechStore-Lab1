using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class TeDhenatBiznesit
{
    public int IdteDhenatBiznesit { get; set; }

    public string? EmriIbiznesit { get; set; }

    public string? ShkurtesaEmritBiznesit { get; set; }

    public int? Nui { get; set; }

    public int? Nf { get; set; }

    public int? Nrtvsh { get; set; }

    public string? Adresa { get; set; }

    public string? NrKontaktit { get; set; }

    public string? Email { get; set; }

    public string? Logo { get; set; }
}
