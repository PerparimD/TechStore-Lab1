using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TechStoreWebAPI.Models;

public partial class TechStoreDbContext : DbContext
{
    public TechStoreDbContext()
    {
    }

    public TechStoreDbContext(DbContextOptions<TechStoreDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ContactForm> ContactForms { get; set; }

    public virtual DbSet<KategoriaProduktit> KategoriaProduktits { get; set; }

    public virtual DbSet<KodiZbritje> KodiZbritjes { get; set; }

    public virtual DbSet<Kompanium> Kompania { get; set; }

    public virtual DbSet<Perdoruesi> Perdoruesis { get; set; }

    public virtual DbSet<Porosit> Porosits { get; set; }

    public virtual DbSet<Produkti> Produktis { get; set; }

    public virtual DbSet<TeDhenatEporosi> TeDhenatEporoses { get; set; }

    public virtual DbSet<TeDhenatPerdoruesit> TeDhenatPerdoruesits { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=RILINDKYCYKU; Database=TechStoreDB;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ContactForm>(entity =>
        {
            entity.HasKey(e => e.MesazhiId).HasName("PK__ContactF__0E3F7CF3896D6952");

            entity.ToTable("ContactForm");

            entity.Property(e => e.MesazhiId).HasColumnName("mesazhiID");
            entity.Property(e => e.DataDergeses)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("date")
                .HasColumnName("dataDergeses");
            entity.Property(e => e.Mesazhi)
                .HasColumnType("text")
                .HasColumnName("mesazhi");
            entity.Property(e => e.Statusi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('Mesazhi juaj eshte derguar tek Stafi')")
                .HasColumnName("statusi");
            entity.Property(e => e.UserId).HasColumnName("userID");

            entity.HasOne(d => d.User).WithMany(p => p.ContactForms)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_ContactForm_Perdoruesi");
        });

        modelBuilder.Entity<KategoriaProduktit>(entity =>
        {
            entity.HasKey(e => e.KategoriaId).HasName("PK__Kategori__AC39DE2A718DB0F6");

            entity.ToTable("KategoriaProduktit");

            entity.Property(e => e.KategoriaId).HasColumnName("kategoriaID");
            entity.Property(e => e.LlojiKategoris)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("llojiKategoris");
            entity.Property(e => e.PershkrimiKategoris)
                .HasColumnType("text")
                .HasColumnName("pershkrimiKategoris");
        });

        modelBuilder.Entity<KodiZbritje>(entity =>
        {
            entity.HasKey(e => e.Kodi).HasName("PK__KodiZbri__25A8748F581632B6");

            entity.Property(e => e.Kodi)
                .HasMaxLength(6)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("kodi");
            entity.Property(e => e.DataKrijimit)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("date")
                .HasColumnName("dataKrijimit");
            entity.Property(e => e.IdProdukti).HasColumnName("idProdukti");
            entity.Property(e => e.QmimiZbritjes)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("qmimiZbritjes");

            entity.HasOne(d => d.IdProduktiNavigation).WithMany(p => p.KodiZbritjes)
                .HasForeignKey(d => d.IdProdukti)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_KodiZbritjes_Produkti");
        });

        modelBuilder.Entity<Kompanium>(entity =>
        {
            entity.HasKey(e => e.KompaniaId).HasName("PK__Kompania__2026D74D2CBCA899");

            entity.Property(e => e.KompaniaId).HasColumnName("kompaniaID");
            entity.Property(e => e.Adresa)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("adresa");
            entity.Property(e => e.EmriKompanis)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("emriKompanis");
            entity.Property(e => e.Logo)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasDefaultValueSql("('kompaniPaFoto.png')")
                .HasColumnName("logo");
        });

        modelBuilder.Entity<Perdoruesi>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Perdorue__CB9A1CDFFF440186");

            entity.ToTable("Perdoruesi");

            entity.HasIndex(e => e.Username, "UQ__Perdorue__F3DBC5721B2F0C29").IsUnique();

            entity.Property(e => e.UserId).HasColumnName("userID");
            entity.Property(e => e.Aksesi)
                .HasDefaultValueSql("((0))")
                .HasColumnName("aksesi");
            entity.Property(e => e.Email)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Emri)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("emri");
            entity.Property(e => e.Mbimeri)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("mbimeri");
            entity.Property(e => e.UserPw)
                .HasMaxLength(70)
                .IsUnicode(false)
                .HasColumnName("userPW");
            entity.Property(e => e.Username)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("username");
        });

        modelBuilder.Entity<Porosit>(entity =>
        {
            entity.HasKey(e => e.IdPorosia).HasName("PK__Porosit__A9F27D2AA2D4B4AE");

            entity.ToTable("Porosit");

            entity.Property(e => e.IdPorosia).HasColumnName("idPorosia");
            entity.Property(e => e.DataPorosis)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("date")
                .HasColumnName("dataPorosis");
            entity.Property(e => e.IdKlienti).HasColumnName("idKlienti");
            entity.Property(e => e.StatusiPorosis)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasDefaultValueSql("('Ne Procesim')")
                .HasColumnName("statusiPorosis");
            entity.Property(e => e.TotaliPorosis)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("totaliPorosis");

            entity.HasOne(d => d.IdKlientiNavigation).WithMany(p => p.Porosits)
                .HasForeignKey(d => d.IdKlienti)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Porosit_Klienti");
        });

        modelBuilder.Entity<Produkti>(entity =>
        {
            entity.HasKey(e => e.ProduktiId).HasName("PK__Produkti__76A3DFCF401E13B1");

            entity.ToTable("Produkti");

            entity.Property(e => e.ProduktiId).HasColumnName("produktiID");
            entity.Property(e => e.EmriProduktit)
                .HasColumnType("text")
                .HasColumnName("emriProduktit");
            entity.Property(e => e.FotoProduktit)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasDefaultValueSql("('produktPaFoto.png')")
                .HasColumnName("fotoProduktit");
            entity.Property(e => e.KategoriaId).HasColumnName("kategoriaID");
            entity.Property(e => e.KompaniaId).HasColumnName("kompaniaID");
            entity.Property(e => e.Pershkrimi)
                .HasColumnType("text")
                .HasColumnName("pershkrimi");
            entity.Property(e => e.QmimiProduktit)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("qmimiProduktit");

            entity.HasOne(d => d.Kategoria).WithMany(p => p.Produktis)
                .HasForeignKey(d => d.KategoriaId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Produkti_Kategoria");

            entity.HasOne(d => d.Kompania).WithMany(p => p.Produktis)
                .HasForeignKey(d => d.KompaniaId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Produkti_Kompania");
        });

        modelBuilder.Entity<TeDhenatEporosi>(entity =>
        {
            entity.HasKey(e => e.IdDetajet).HasName("PK__TeDhenat__494F491F08848686");

            entity.ToTable("TeDhenatEPorosis");

            entity.Property(e => e.IdDetajet).HasColumnName("idDetajet");
            entity.Property(e => e.IdPorosia).HasColumnName("idPorosia");
            entity.Property(e => e.IdProdukti).HasColumnName("idProdukti");
            entity.Property(e => e.KodiZbritjes)
                .HasMaxLength(6)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("kodiZbritjes");
            entity.Property(e => e.QmimiTotal)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("qmimiTotal");
            entity.Property(e => e.SasiaPorositur).HasColumnName("sasiaPorositur");

            entity.HasOne(d => d.IdPorosiaNavigation).WithMany(p => p.TeDhenatEporosis)
                .HasForeignKey(d => d.IdPorosia)
                .HasConstraintName("FK_TeDhenatPorosis_Porosia");

            entity.HasOne(d => d.IdProduktiNavigation).WithMany(p => p.TeDhenatEporosis)
                .HasForeignKey(d => d.IdProdukti)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_TeDhenatPorosis_Produkti");

            entity.HasOne(d => d.KodiZbritjesNavigation).WithMany(p => p.TeDhenatEporosis)
                .HasForeignKey(d => d.KodiZbritjes)
                .HasConstraintName("FK_TeDhenatPorosis_KodiZbritjes");
        });

        modelBuilder.Entity<TeDhenatPerdoruesit>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("TeDhenatPerdoruesit");

            entity.Property(e => e.UserId)
                .ValueGeneratedNever()
                .HasColumnName("userID");
            entity.Property(e => e.Adresa)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("adresa");
            entity.Property(e => e.NrKontaktit)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("nrKontaktit");
            entity.Property(e => e.Qyteti)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("qyteti");
            entity.Property(e => e.ZipKodi).HasColumnName("zipKodi");

            entity.HasOne(d => d.User).WithOne(p => p.TeDhenatPerdoruesit)
                .HasForeignKey<TeDhenatPerdoruesit>(d => d.UserId)
                .HasConstraintName("FK_TeDhenatPerdorues_Perdoruesi");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
