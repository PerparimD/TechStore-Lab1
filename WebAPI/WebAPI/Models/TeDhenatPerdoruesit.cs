﻿using System;
using System.Collections.Generic;

namespace WebAPI.Models;

public partial class TeDhenatPerdoruesit
{
    public int UserId { get; set; }

    public string? NrKontaktit { get; set; }

    public string? Qyteti { get; set; }

    public int? ZipKodi { get; set; }

    public string? Adresa { get; set; }
    public string? Shteti { get; set; }

    public virtual Perdoruesi? User { get; set; }
}
