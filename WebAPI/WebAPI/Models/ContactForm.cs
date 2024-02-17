using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Models;

public partial class ContactForm
{
    [Key]
    public int MesazhiId { get; set; }

    public int? UserId { get; set; }

    public string? Mesazhi { get; set; } = "";

    public DateTime? DataDergeses { get; set; } = DateTime.Now;

    public string? Statusi { get; set; } = "Mesazhi juaj eshte derguar tek Stafi";

    public string? Emri { get; set; } = "";

    public string? Email { get; set; } = "";
    [ForeignKey("UserId")]
    public virtual Perdoruesi? User { get; set; }
}
