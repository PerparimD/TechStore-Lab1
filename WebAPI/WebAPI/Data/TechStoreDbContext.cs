using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using WebAPI.Models;

namespace WebAPI.Data;

public partial class TechStoreDbContext : IdentityDbContext
{
    public TechStoreDbContext(DbContextOptions<TechStoreDbContext> options) : base(options)
    {

    }

    public DbSet<ContactForm> ContactForm { get; set; }
    public DbSet<KategoriaProduktit> KategoriaProduktit { get; set; }
    public DbSet<KodiZbritjes> KodiZbritjes { get; set; }
    public DbSet<Kompania> Kompania { get; set; }
    public DbSet<Perdoruesi> Perdoruesi { get; set; }
    public DbSet<Porosit> Porosit { get; set; }
    public DbSet<Produkti> Produkti { get; set; }
    public DbSet<RegjistrimiStokut> RegjistrimiStokut { get; set; }
    public DbSet<StokuQmimiProduktit> StokuQmimiProduktit { get; set; }
    public DbSet<TeDhenatBiznesit> TeDhenatBiznesit { get; set; }
    public DbSet<TeDhenatEPorosis> TeDhenatEPorosis { get; set; }
    public DbSet<TeDhenatPerdoruesit> TeDhenatPerdoruesit { get; set; }
    public DbSet<TeDhenatRegjistrimit> TeDhenatRegjistrimit { get; set; }
    public DbSet<ZbritjaQmimitProduktit> ZbritjaQmimitProduktit { get; set; }
    public DbSet<Banka57449> Banka57449 { get; set; }
    public DbSet<Personi57449> Personi57449 { get; set; }
}
