﻿using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class Perdoruesi
{
    public int UserId { get; set; }

    public string? Emri { get; set; }

    public string? Mbiemri { get; set; }

    public string? Email { get; set; }

    public string? Username { get; set; }

    public string? UserPw { get; set; }

    public int? Aksesi { get; set; }

    public virtual ICollection<ContactForm> ContactForms { get; } = new List<ContactForm>();

    public virtual ICollection<Porosit> Porosits { get; } = new List<Porosit>();

    public virtual ICollection<RegjistrimiStokut> RegjistrimiStokuts { get; } = new List<RegjistrimiStokut>();

    public virtual TeDhenatPerdoruesit? TeDhenatPerdoruesit { get; set; }
}
