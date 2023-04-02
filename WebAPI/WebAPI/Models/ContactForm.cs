using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class ContactForm
{
    public int MesazhiId { get; set; }

    public int? UserId { get; set; }

    public string Mesazhi { get; set; } = null!;

    public DateTime? DataDergeses { get; set; }

    public string? Statusi { get; set; }

    public virtual Perdoruesi? User { get; set; }
}
