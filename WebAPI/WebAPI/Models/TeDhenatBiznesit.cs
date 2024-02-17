using System.ComponentModel.DataAnnotations;

namespace WebAPI.Models;

public partial class TeDhenatBiznesit
{
    [Key]
    public int IdteDhenatBiznesit { get; set; }

    public string? EmriIbiznesit { get; set; } = "";

    public string? ShkurtesaEmritBiznesit { get; set; } = "";

    public int? Nui { get; set; } = 0;

    public int? Nf { get; set; } = 0;

    public int? Nrtvsh { get; set; } = 0;

    public string? Adresa { get; set; } = "";

    public string? NrKontaktit { get; set; } = "";

    public string? Email { get; set; } = "";

    public string? Logo { get; set; } = "PaLogo.png";
}
