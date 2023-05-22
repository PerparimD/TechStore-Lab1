
using Microsoft.AspNetCore.Identity;

namespace WebAPI.Models;

public class Perdoruesi
{
    public int UserId { get; set; }
    public string? Emri { get; set; }
    public string? Mbiemri { get; set; }
    public string? Email { get; set; }
    public string? Username { get; set; }
    public string? AspNetUserId { get; set; } // Foreign key property
    public virtual ICollection<ContactForm> ContactForms { get; set; } = new List<ContactForm>();
    public virtual ICollection<Porosit> Porosits { get; set; } = new List<Porosit>();
    public virtual ICollection<RegjistrimiStokut> RegjistrimiStokuts { get; set; } = new List<RegjistrimiStokut>();
    public virtual TeDhenatPerdoruesit? TeDhenatPerdoruesit { get; set; }
}