using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class Perdoruesi
{
    [Key]
    public int UserId { get; set; }
    public string? Emri { get; set; }
    public string? Mbiemri { get; set; }

    public string? Email { get; set; }
    public string? Username { get; set; }
    public string? AspNetUserId { get; set; }
    [ForeignKey("AspNetUserId")]
    public IdentityUser AspNetUser { get; set; }

    public virtual List<ContactForm>? ContactForm { get; set; }
    public virtual List<Porosit>? Porosit { get; set; }
    public virtual List<RegjistrimiStokut>? RegjistrimiStokut { get; set; }
    public virtual TeDhenatPerdoruesit? TeDhenatPerdoruesit { get; set; }
}
