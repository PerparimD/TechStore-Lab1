using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;

namespace WebAPI.Models;

public partial class TechStoreDbContext : IdentityDbContext
{

    public TechStoreDbContext()
    {
    }
    public TechStoreDbContext(DbContextOptions<TechStoreDbContext> options) : base(options)
    {

    }
    public virtual DbSet<ContactForm> ContactForms { get; set; }

    public virtual DbSet<KategoriaProduktit> KategoriaProduktits { get; set; }

    public virtual DbSet<KodiZbritje> KodiZbritjes { get; set; }

    public virtual DbSet<Kompanium> Kompania { get; set; }

    public virtual DbSet<Perdoruesi> Perdoruesis { get; set; }

    public virtual DbSet<Porosit> Porosits { get; set; }

    public virtual DbSet<Produkti> Produktis { get; set; }

    public virtual DbSet<RegjistrimiStokut> RegjistrimiStokuts { get; set; }

    public virtual DbSet<StokuQmimiProduktit> StokuQmimiProduktits { get; set; }

    public virtual DbSet<TeDhenatEporosi> TeDhenatEporoses { get; set; }

    public virtual DbSet<TeDhenatPerdoruesit> TeDhenatPerdoruesits { get; set; }

    public virtual DbSet<TeDhenatRegjistrimit> TeDhenatRegjistrimits { get; set; }

    public virtual DbSet<ZbritjaQmimitProduktit> ZbritjaQmimitProduktits { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ContactForm>(entity =>
        {
            entity.HasKey(e => e.MesazhiId).HasName("PK__ContactF__0E3F7CF3731C8CDE");

            entity.ToTable("ContactForm");

            entity.HasIndex(e => e.UserId, "IX_ContactForm_userID");

            entity.Property(e => e.MesazhiId).HasColumnName("mesazhiID");
            entity.Property(e => e.DataDergeses)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("date")
                .HasColumnName("dataDergeses");
            entity.Property(e => e.Email)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Emri)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("emri");
            entity.Property(e => e.Mesazhi)
                .HasColumnType("text")
                .HasColumnName("mesazhi");
            entity.Property(e => e.Statusi)
                .HasMaxLength(60)
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
            entity.HasKey(e => e.KategoriaId).HasName("PK__Kategori__AC39DE2ACE8BCA8A");

            entity.ToTable("KategoriaProduktit");

            entity.Property(e => e.KategoriaId).HasColumnName("kategoriaID");
            entity.Property(e => e.LlojiKategoris)
                .HasColumnType("text")
                .HasColumnName("llojiKategoris");
            entity.Property(e => e.PershkrimiKategoris)
                .HasColumnType("text")
                .HasColumnName("pershkrimiKategoris");
        });

        modelBuilder.Entity<KodiZbritje>(entity =>
        {
            entity.HasKey(e => e.Kodi).HasName("PK__KodiZbri__25A8748FB3E013A8");

            entity.HasIndex(e => e.IdProdukti, "IX_KodiZbritjes_idProdukti");

            entity.Property(e => e.Kodi)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("kodi");
            entity.Property(e => e.DataKrijimit)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("dataKrijimit");
            entity.Property(e => e.IdProdukti).HasColumnName("idProdukti");
            entity.Property(e => e.QmimiZbritjes)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiZbritjes");

            entity.HasOne(d => d.IdProduktiNavigation).WithMany(p => p.KodiZbritjes)
                .HasForeignKey(d => d.IdProdukti)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_KodiZbritjes_Produkti");
        });

        modelBuilder.Entity<Kompanium>(entity =>
        {
            entity.HasKey(e => e.KompaniaId).HasName("PK__Kompania__2026D74DCB37AA9A");

            entity.Property(e => e.KompaniaId).HasColumnName("kompaniaID");
            entity.Property(e => e.Adresa)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("adresa");
            entity.Property(e => e.EmriKompanis)
                .HasColumnType("text")
                .HasColumnName("emriKompanis");
            entity.Property(e => e.Logo)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasDefaultValueSql("('kompaniPaFoto.png')")
                .HasColumnName("logo");
        });

        modelBuilder.Entity<Perdoruesi>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Perdorue__CB9A1CDFC4C4A0AA");

            entity.ToTable("Perdoruesi");

            entity.HasIndex(e => e.Username, "UQ__Perdorue__F3DBC5728A6B6DAE")
                .IsUnique()
                .HasFilter("([username] IS NOT NULL)");

            entity.Property(e => e.UserId).HasColumnName("userID");
            entity.Property(e => e.AspNetUserId)
                .HasMaxLength(450)
                .HasColumnName("AspNetUserID");
            entity.Property(e => e.Email)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Emri)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("emri");
            entity.Property(e => e.Mbiemri)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("mbiemri");
            entity.Property(e => e.Username)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("username");
        });

        

        modelBuilder.Entity<Porosit>(entity =>
        {
            entity.HasKey(e => e.IdPorosia).HasName("PK__Porosit__A9F27D2AB271ADFC");

            entity.ToTable("Porosit");

            entity.HasIndex(e => e.IdKlienti, "IX_Porosit_idKlienti");

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
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("totaliPorosis");
            entity.Property(e => e.Zbritja)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("zbritja");
            entity.Property(e => e.TotaliProdukteve)
                .HasColumnName("totaliProdukteve");
            
            entity.HasOne(d => d.IdKlientiNavigation).WithMany(p => p.Porosits)
                .HasForeignKey(d => d.IdKlienti)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Porosit_Klienti");
        });

        modelBuilder.Entity<Produkti>(entity =>
        {
            entity.HasKey(e => e.ProduktiId).HasName("PK__Produkti__76A3DFCF91A50347");

            entity.ToTable("Produkti");

            entity.HasIndex(e => e.KategoriaId, "IX_Produkti_kategoriaID");

            entity.HasIndex(e => e.KompaniaId, "IX_Produkti_kompaniaID");

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

            entity.HasOne(d => d.Kategoria).WithMany(p => p.Produktis)
                .HasForeignKey(d => d.KategoriaId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Produkti_Kategoria");

            entity.HasOne(d => d.Kompania).WithMany(p => p.Produktis)
                .HasForeignKey(d => d.KompaniaId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Produkti_Kompania");
        });

        modelBuilder.Entity<RegjistrimiStokut>(entity =>
        {
            entity.HasKey(e => e.IdRegjistrimit);

            entity.ToTable("RegjistrimiStokut");

            entity.HasIndex(e => e.StafiId, "IX_RegjistrimiStokut_stafiID");

            entity.Property(e => e.IdRegjistrimit).HasColumnName("idRegjistrimit");
            entity.Property(e => e.DataRegjistrimit)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("dataRegjistrimit");
            entity.Property(e => e.ShumaTotaleBlerese)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("shumaTotaleBlerese");
            entity.Property(e => e.ShumaTotaleRegjistrimit)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("shumaTotaleRegjistrimit");
            entity.Property(e => e.StafiId).HasColumnName("stafiID");
            entity.Property(e => e.TotaliProdukteveRegjistruara).HasColumnName("totaliProdukteveRegjistruara");

            entity.HasOne(d => d.Stafi).WithMany(p => p.RegjistrimiStokuts)
                .HasForeignKey(d => d.StafiId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Regjistrimi_Perdoruesi");
        });

        modelBuilder.Entity<StokuQmimiProduktit>(entity =>
        {
            entity.HasKey(e => e.ProduktiId).HasName("PK_StokuProduktit");

            entity.ToTable("StokuQmimiProduktit");

            entity.Property(e => e.ProduktiId)
                .ValueGeneratedNever()
                .HasColumnName("produktiID");
            entity.Property(e => e.DataKrijimit)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("dataKrijimit");
            entity.Property(e => e.DataPerditsimit)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("dataPerditsimit");
            entity.Property(e => e.QmimiBleres)
                .HasDefaultValueSql("((0))")
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiBleres");
            entity.Property(e => e.QmimiProduktit)
                .HasDefaultValueSql("((0))")
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiProduktit");
            entity.Property(e => e.SasiaNeStok)
                .HasDefaultValueSql("((0))")
                .HasColumnName("sasiaNeStok");

            entity.HasOne(d => d.Produkti).WithOne(p => p.StokuQmimiProduktit).HasForeignKey<StokuQmimiProduktit>(d => d.ProduktiId);
        });

        modelBuilder.Entity<TeDhenatEporosi>(entity =>
        {
            entity.HasKey(e => e.IdDetajet).HasName("PK__TeDhenat__494F491F84D65D51");

            entity.ToTable("TeDhenatEPorosis");

            entity.HasIndex(e => e.IdPorosia, "IX_TeDhenatEPorosis_idPorosia");

            entity.HasIndex(e => e.IdProdukti, "IX_TeDhenatEPorosis_idProdukti");

            entity.Property(e => e.IdDetajet).HasColumnName("idDetajet");
            entity.Property(e => e.IdPorosia).HasColumnName("idPorosia");
            entity.Property(e => e.IdProdukti).HasColumnName("idProdukti");
            entity.Property(e => e.QmimiTotal)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiTotal");
            entity.Property(e => e.SasiaPorositur).HasColumnName("sasiaPorositur");
            entity.Property(e => e.QmimiProduktit)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiProduktit");

            entity.HasOne(d => d.IdPorosiaNavigation).WithMany(p => p.TeDhenatEporosis)
                .HasForeignKey(d => d.IdPorosia)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_TeDhenatPorosis_Porosia");

            entity.HasOne(d => d.IdProduktiNavigation).WithMany(p => p.TeDhenatEporosis)
                .HasForeignKey(d => d.IdProdukti)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_TeDhenatPorosis_Produkti");
        });

        modelBuilder.Entity<TeDhenatPerdoruesit>(entity =>
        {
            entity.HasKey(e => e.UserId);
            entity.ToTable("TeDhenatPerdoruesit");

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
            entity.Property(e => e.UserId).HasColumnName("userID");
            entity.Property(e => e.ZipKodi).HasColumnName("zipKodi");

            entity.HasOne(d => d.User).WithOne(p => p.TeDhenatPerdoruesit)
                .HasForeignKey<TeDhenatPerdoruesit>(d => d.UserId)
                .HasConstraintName("FK_TeDhenatPerdorues_Perdoruesi");
        });

        modelBuilder.Entity<TeDhenatRegjistrimit>(entity =>
        {
            entity.ToTable("TeDhenatRegjistrimit");

            entity.HasIndex(e => e.IdProduktit, "IX_TeDhenatRegjistrimit_idProduktit");

            entity.HasIndex(e => e.IdRegjistrimit, "IX_TeDhenatRegjistrimit_idRegjistrimit");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdProduktit).HasColumnName("idProduktit");
            entity.Property(e => e.IdRegjistrimit).HasColumnName("idRegjistrimit");
            entity.Property(e => e.QmimiBleres)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiBleres");
            entity.Property(e => e.QmimiShites)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiShites");
            entity.Property(e => e.SasiaStokut).HasColumnName("sasiaStokut");

            entity.HasOne(d => d.IdProduktitNavigation).WithMany(p => p.TeDhenatRegjistrimits)
                .HasForeignKey(d => d.IdProduktit)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Produkti_TeDhenatRegjistrimit");

            entity.HasOne(d => d.IdRegjistrimitNavigation).WithMany(p => p.TeDhenatRegjistrimits)
                .HasForeignKey(d => d.IdRegjistrimit)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("FK_RegjistrimiStokut_TeDhenatRegjistrimit");
        });

        modelBuilder.Entity<ZbritjaQmimitProduktit>(entity =>
        {
            entity.HasKey(e => e.ProduktiId);

            entity.ToTable("ZbritjaQmimitProduktit");

            entity.Property(e => e.ProduktiId)
                .ValueGeneratedNever()
                .HasColumnName("produktiID");
            entity.Property(e => e.DataSkadimit)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("dataSkadimit");
            entity.Property(e => e.DataZbritjes)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("dataZbritjes");
            entity.Property(e => e.QmimiMeZbritjeProduktit)
                .HasDefaultValueSql("((0))")
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiMeZbritjeProduktit");
            entity.Property(e => e.QmimiPaZbritjeProduktit)
                .HasDefaultValueSql("((0))")
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("qmimiPaZbritjeProduktit");

            entity.HasOne(d => d.Produkti).WithOne(p => p.ZbritjaQmimitProduktit).HasForeignKey<ZbritjaQmimitProduktit>(d => d.ProduktiId);
        });

        modelBuilder
                .HasAnnotation("ProductVersion", "6.0.7")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

        SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

        modelBuilder.Entity<IdentityRole>(b =>
        {
            b.Property<string>("Id")
                .HasColumnType("nvarchar(450)");

            b.Property<string>("ConcurrencyStamp")
                .IsConcurrencyToken()
                .HasColumnType("nvarchar(max)");

            b.Property<string>("Name")
                .HasMaxLength(256)
                .HasColumnType("nvarchar(256)");

            b.Property<string>("NormalizedName")
                .HasMaxLength(256)
                .HasColumnType("nvarchar(256)");

            b.HasKey("Id");

            b.HasIndex("NormalizedName")
                .IsUnique()
                .HasDatabaseName("RoleNameIndex")
                .HasFilter("[NormalizedName] IS NOT NULL");

            b.ToTable("AspNetRoles", (string)null);
        });

        modelBuilder.Entity<IdentityRoleClaim<string>>(b =>
        {
            b.Property<int>("Id")
                .ValueGeneratedOnAdd()
                .HasColumnType("int");

            SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

            b.Property<string>("ClaimType")
                .HasColumnType("nvarchar(max)");

            b.Property<string>("ClaimValue")
                .HasColumnType("nvarchar(max)");

            b.Property<string>("RoleId")
                .IsRequired()
                .HasColumnType("nvarchar(450)");

            b.HasKey("Id");

            b.HasIndex("RoleId");

            b.ToTable("AspNetRoleClaims", (string)null);
        });

        modelBuilder.Entity<IdentityUser>(b =>
        {
            b.Property<string>("Id")
                .HasColumnType("nvarchar(450)");

            b.Property<int>("AccessFailedCount")
                .HasColumnType("int");

            b.Property<string>("ConcurrencyStamp")
                .IsConcurrencyToken()
                .HasColumnType("nvarchar(max)");

            b.Property<string>("Email")
                .HasMaxLength(256)
                .HasColumnType("nvarchar(256)");

            b.Property<bool>("EmailConfirmed")
                .HasColumnType("bit");

            b.Property<bool>("LockoutEnabled")
                .HasColumnType("bit");

            b.Property<DateTimeOffset?>("LockoutEnd")
                .HasColumnType("datetimeoffset");

            b.Property<string>("NormalizedEmail")
                .HasMaxLength(256)
                .HasColumnType("nvarchar(256)");

            b.Property<string>("NormalizedUserName")
                .HasMaxLength(256)
                .HasColumnType("nvarchar(256)");

            b.Property<string>("PasswordHash")
                .HasColumnType("nvarchar(max)");

            b.Property<string>("PhoneNumber")
                .HasColumnType("nvarchar(max)");

            b.Property<bool>("PhoneNumberConfirmed")
                .HasColumnType("bit");

            b.Property<string>("SecurityStamp")
                .HasColumnType("nvarchar(max)");

            b.Property<bool>("TwoFactorEnabled")
                .HasColumnType("bit");

            b.Property<string>("UserName")
                .HasMaxLength(256)
                .HasColumnType("nvarchar(256)");

            b.HasKey("Id");

            b.HasIndex("NormalizedEmail")
                .HasDatabaseName("EmailIndex");

            b.HasIndex("NormalizedUserName")
                .IsUnique()
                .HasDatabaseName("UserNameIndex")
                .HasFilter("[NormalizedUserName] IS NOT NULL");

            b.ToTable("AspNetUsers", (string)null);
        });

        modelBuilder.Entity<IdentityUserClaim<string>>(b =>
        {
            b.Property<int>("Id")
                .ValueGeneratedOnAdd()
                .HasColumnType("int");

            SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

            b.Property<string>("ClaimType")
                .HasColumnType("nvarchar(max)");

            b.Property<string>("ClaimValue")
                .HasColumnType("nvarchar(max)");

            b.Property<string>("UserId")
                .IsRequired()
                .HasColumnType("nvarchar(450)");

            b.HasKey("Id");

            b.HasIndex("UserId");

            b.ToTable("AspNetUserClaims", (string)null);
        });

        modelBuilder.Entity<IdentityUserLogin<string>>(b =>
        {
            b.Property<string>("LoginProvider")
                .HasColumnType("nvarchar(450)");

            b.Property<string>("ProviderKey")
                .HasColumnType("nvarchar(450)");

            b.Property<string>("ProviderDisplayName")
                .HasColumnType("nvarchar(max)");

            b.Property<string>("UserId")
                .IsRequired()
                .HasColumnType("nvarchar(450)");

            b.HasKey("LoginProvider", "ProviderKey");

            b.HasIndex("UserId");

            b.ToTable("AspNetUserLogins", (string)null);
        });

        modelBuilder.Entity<IdentityUserRole<string>>(b =>
        {
            b.Property<string>("UserId")
                .HasColumnType("nvarchar(450)");

            b.Property<string>("RoleId")
                .HasColumnType("nvarchar(450)");

            b.HasKey("UserId", "RoleId");

            b.HasIndex("RoleId");

            b.ToTable("AspNetUserRoles", (string)null);
        });

        modelBuilder.Entity<IdentityUserToken<string>>(b =>
        {
            b.Property<string>("UserId")
                .HasColumnType("nvarchar(450)");

            b.Property<string>("LoginProvider")
                .HasColumnType("nvarchar(450)");

            b.Property<string>("Name")
                .HasColumnType("nvarchar(450)");

            b.Property<string>("Value")
                .HasColumnType("nvarchar(max)");

            b.HasKey("UserId", "LoginProvider", "Name");

            b.ToTable("AspNetUserTokens", (string)null);
        });

        modelBuilder.Entity<IdentityRoleClaim<string>>(b =>
        {
            b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                .WithMany()
                .HasForeignKey("RoleId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired();
        });

        modelBuilder.Entity<IdentityUserClaim<string>>(b =>
        {
            b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                .WithMany()
                .HasForeignKey("UserId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired();
        });

        modelBuilder.Entity<IdentityUserLogin<string>>(b =>
        {
            b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                .WithMany()
                .HasForeignKey("UserId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired();
        });

        modelBuilder.Entity<IdentityUserRole<string>>(b =>
        {
            b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                .WithMany()
                .HasForeignKey("RoleId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired();

            b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                .WithMany()
                .HasForeignKey("UserId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired();
        });

        modelBuilder.Entity<IdentityUserToken<string>>(b =>
        {
            b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                .WithMany()
                .HasForeignKey("UserId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired();
        });

        base.OnModelCreating(modelBuilder);

    }

}
