﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using WebAPI.Data;

#nullable disable

namespace WebAPI.Migrations
{
    [DbContext(typeof(TechStoreDbContext))]
    [Migration("20240416170627_KrijimiDatabazesMbrojtjaProjektitDet3")]
    partial class KrijimiDatabazesMbrojtjaProjektitDet3
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
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

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

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

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUser", b =>
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

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

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

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
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

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("RoleId")
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
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

            modelBuilder.Entity("WebAPI.Models.ContactForm", b =>
                {
                    b.Property<int>("MesazhiId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("MesazhiId"));

                    b.Property<DateTime?>("DataDergeses")
                        .HasColumnType("datetime2");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Emri")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Mesazhi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Statusi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("UserId")
                        .HasColumnType("int");

                    b.HasKey("MesazhiId");

                    b.HasIndex("UserId");

                    b.ToTable("ContactForm");
                });

            modelBuilder.Entity("WebAPI.Models.KategoriaProduktit", b =>
                {
                    b.Property<int>("KategoriaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KategoriaId"));

                    b.Property<string>("LlojiKategoris")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PershkrimiKategoris")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("KategoriaId");

                    b.ToTable("KategoriaProduktit");
                });

            modelBuilder.Entity("WebAPI.Models.KodiZbritjes", b =>
                {
                    b.Property<string>("Kodi")
                        .HasColumnType("nvarchar(450)");

                    b.Property<DateTime?>("DataKrijimit")
                        .HasColumnType("datetime2");

                    b.Property<int?>("IdProdukti")
                        .HasColumnType("int");

                    b.Property<decimal?>("QmimiZbritjes")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("Kodi");

                    b.HasIndex("IdProdukti");

                    b.ToTable("KodiZbritjes");
                });

            modelBuilder.Entity("WebAPI.Models.Kompania", b =>
                {
                    b.Property<int>("KompaniaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KompaniaId"));

                    b.Property<string>("Adresa")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("EmriKompanis")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Logo")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("KompaniaId");

                    b.ToTable("Kompania");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Banka57449", b =>
                {
                    b.Property<int>("Id57449")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id57449"));

                    b.Property<string>("Emri57449")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id57449");

                    b.ToTable("Banka57449");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Personi57449", b =>
                {
                    b.Property<int>("Id57449")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id57449"));

                    b.Property<int?>("Banka57449ID")
                        .HasColumnType("int");

                    b.Property<string>("Emri57449")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Mbiemri57449")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id57449");

                    b.HasIndex("Banka57449ID");

                    b.ToTable("Personi57449");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Planet212257449", b =>
                {
                    b.Property<int>("PlanetId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PlanetId"));

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Type")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("isDeleted")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PlanetId");

                    b.ToTable("Planet212257449");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Satellite212257449", b =>
                {
                    b.Property<int>("SatelliteId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("SatelliteId"));

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("PlanetId")
                        .HasColumnType("int");

                    b.Property<string>("isDeleted")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("SatelliteId");

                    b.HasIndex("PlanetId");

                    b.ToTable("Satellite212257449");
                });

            modelBuilder.Entity("WebAPI.Models.Perdoruesi", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("UserId"));

                    b.Property<string>("AspNetUserId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Emri")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Mbiemri")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Username")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UserId");

                    b.HasIndex("AspNetUserId");

                    b.ToTable("Perdoruesi");
                });

            modelBuilder.Entity("WebAPI.Models.Player", b =>
                {
                    b.Property<int>("PlayerId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PlayerId"));

                    b.Property<int?>("BirthYear")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("Number")
                        .HasColumnType("int");

                    b.Property<int?>("TeamId")
                        .HasColumnType("int");

                    b.HasKey("PlayerId");

                    b.HasIndex("TeamId");

                    b.ToTable("Player");
                });

            modelBuilder.Entity("WebAPI.Models.Porosit", b =>
                {
                    b.Property<int>("IdPorosia")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdPorosia"));

                    b.Property<DateTime?>("DataPorosis")
                        .HasColumnType("datetime2");

                    b.Property<int?>("IdKlienti")
                        .HasColumnType("int");

                    b.Property<string>("StatusiPorosis")
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal?>("TotaliPorosis")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int?>("TotaliProdukteve")
                        .HasColumnType("int");

                    b.Property<decimal?>("Zbritja")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("IdPorosia");

                    b.HasIndex("IdKlienti");

                    b.ToTable("Porosit");
                });

            modelBuilder.Entity("WebAPI.Models.Produkti", b =>
                {
                    b.Property<int>("ProduktiId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ProduktiId"));

                    b.Property<string>("EmriProduktit")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FotoProduktit")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("KategoriaId")
                        .HasColumnType("int");

                    b.Property<int?>("KompaniaId")
                        .HasColumnType("int");

                    b.Property<string>("Pershkrimi")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ProduktiId");

                    b.HasIndex("KategoriaId");

                    b.HasIndex("KompaniaId");

                    b.ToTable("Produkti");
                });

            modelBuilder.Entity("WebAPI.Models.RegjistrimiStokut", b =>
                {
                    b.Property<int>("IdRegjistrimit")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdRegjistrimit"));

                    b.Property<DateTime?>("DataRegjistrimit")
                        .HasColumnType("datetime2");

                    b.Property<decimal?>("ShumaTotaleBlerese")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal?>("ShumaTotaleRegjistrimit")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int?>("StafiId")
                        .HasColumnType("int");

                    b.Property<int?>("TotaliProdukteveRegjistruara")
                        .HasColumnType("int");

                    b.HasKey("IdRegjistrimit");

                    b.HasIndex("StafiId");

                    b.ToTable("RegjistrimiStokut");
                });

            modelBuilder.Entity("WebAPI.Models.StokuQmimiProduktit", b =>
                {
                    b.Property<int>("StokuID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("StokuID"));

                    b.Property<DateTime?>("DataKrijimit")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DataPerditsimit")
                        .HasColumnType("datetime2");

                    b.Property<int>("ProduktiId")
                        .HasColumnType("int");

                    b.Property<decimal?>("QmimiBleres")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal?>("QmimiProduktit")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int?>("SasiaNeStok")
                        .HasColumnType("int");

                    b.HasKey("StokuID");

                    b.HasIndex("ProduktiId")
                        .IsUnique();

                    b.ToTable("StokuQmimiProduktit");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatBiznesit", b =>
                {
                    b.Property<int>("IdteDhenatBiznesit")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdteDhenatBiznesit"));

                    b.Property<string>("Adresa")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("EmriIbiznesit")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Logo")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("Nf")
                        .HasColumnType("int");

                    b.Property<string>("NrKontaktit")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("Nrtvsh")
                        .HasColumnType("int");

                    b.Property<int?>("Nui")
                        .HasColumnType("int");

                    b.Property<string>("ShkurtesaEmritBiznesit")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("IdteDhenatBiznesit");

                    b.ToTable("TeDhenatBiznesit");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatEPorosis", b =>
                {
                    b.Property<int>("IdDetajet")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdDetajet"));

                    b.Property<int?>("IdPorosia")
                        .HasColumnType("int");

                    b.Property<int?>("IdProdukti")
                        .HasColumnType("int");

                    b.Property<decimal?>("QmimiProduktit")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal?>("QmimiTotal")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int?>("SasiaPorositur")
                        .HasColumnType("int");

                    b.HasKey("IdDetajet");

                    b.HasIndex("IdPorosia");

                    b.HasIndex("IdProdukti");

                    b.ToTable("TeDhenatEPorosis");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatPerdoruesit", b =>
                {
                    b.Property<int>("TeDhenatId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("TeDhenatId"));

                    b.Property<string>("Adresa")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NrKontaktit")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Qyteti")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Shteti")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.Property<int?>("ZipKodi")
                        .HasColumnType("int");

                    b.HasKey("TeDhenatId");

                    b.HasIndex("UserId")
                        .IsUnique();

                    b.ToTable("TeDhenatPerdoruesit");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatRegjistrimit", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int?>("IdProduktit")
                        .HasColumnType("int");

                    b.Property<int?>("IdRegjistrimit")
                        .HasColumnType("int");

                    b.Property<decimal?>("QmimiBleres")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal?>("QmimiShites")
                        .HasColumnType("decimal(18,2)");

                    b.Property<int?>("SasiaStokut")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("IdProduktit");

                    b.HasIndex("IdRegjistrimit");

                    b.ToTable("TeDhenatRegjistrimit");
                });

            modelBuilder.Entity("WebAPI.Models.Team", b =>
                {
                    b.Property<int>("TeamId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("TeamId"));

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("TeamId");

                    b.ToTable("Team");
                });

            modelBuilder.Entity("WebAPI.Models.ZbritjaQmimitProduktit", b =>
                {
                    b.Property<int>("ZbritjaID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ZbritjaID"));

                    b.Property<DateTime?>("DataSkadimit")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DataZbritjes")
                        .HasColumnType("datetime2");

                    b.Property<int>("ProduktiId")
                        .HasColumnType("int");

                    b.Property<decimal?>("QmimiMeZbritjeProduktit")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal?>("QmimiPaZbritjeProduktit")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("ZbritjaID");

                    b.HasIndex("ProduktiId")
                        .IsUnique();

                    b.ToTable("ZbritjaQmimitProduktit");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
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

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("WebAPI.Models.ContactForm", b =>
                {
                    b.HasOne("WebAPI.Models.Perdoruesi", "User")
                        .WithMany("ContactForm")
                        .HasForeignKey("UserId");

                    b.Navigation("User");
                });

            modelBuilder.Entity("WebAPI.Models.KodiZbritjes", b =>
                {
                    b.HasOne("WebAPI.Models.Produkti", "Produkti")
                        .WithMany("KodiZbritjes")
                        .HasForeignKey("IdProdukti");

                    b.Navigation("Produkti");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Personi57449", b =>
                {
                    b.HasOne("WebAPI.Models.MbrojtjaEProjektit.Banka57449", "Banka57449")
                        .WithMany("Personi57449")
                        .HasForeignKey("Banka57449ID");

                    b.Navigation("Banka57449");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Satellite212257449", b =>
                {
                    b.HasOne("WebAPI.Models.MbrojtjaEProjektit.Planet212257449", "Planet")
                        .WithMany("Satellite")
                        .HasForeignKey("PlanetId");

                    b.Navigation("Planet");
                });

            modelBuilder.Entity("WebAPI.Models.Perdoruesi", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", "AspNetUser")
                        .WithMany()
                        .HasForeignKey("AspNetUserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("AspNetUser");
                });

            modelBuilder.Entity("WebAPI.Models.Player", b =>
                {
                    b.HasOne("WebAPI.Models.Team", "Team")
                        .WithMany("Player")
                        .HasForeignKey("TeamId");

                    b.Navigation("Team");
                });

            modelBuilder.Entity("WebAPI.Models.Porosit", b =>
                {
                    b.HasOne("WebAPI.Models.Perdoruesi", "Klienti")
                        .WithMany("Porosit")
                        .HasForeignKey("IdKlienti");

                    b.Navigation("Klienti");
                });

            modelBuilder.Entity("WebAPI.Models.Produkti", b =>
                {
                    b.HasOne("WebAPI.Models.KategoriaProduktit", "Kategoria")
                        .WithMany("Produkti")
                        .HasForeignKey("KategoriaId");

                    b.HasOne("WebAPI.Models.Kompania", "Kompania")
                        .WithMany("Produkti")
                        .HasForeignKey("KompaniaId");

                    b.Navigation("Kategoria");

                    b.Navigation("Kompania");
                });

            modelBuilder.Entity("WebAPI.Models.RegjistrimiStokut", b =>
                {
                    b.HasOne("WebAPI.Models.Perdoruesi", "Stafi")
                        .WithMany("RegjistrimiStokut")
                        .HasForeignKey("StafiId");

                    b.Navigation("Stafi");
                });

            modelBuilder.Entity("WebAPI.Models.StokuQmimiProduktit", b =>
                {
                    b.HasOne("WebAPI.Models.Produkti", "Produkti")
                        .WithOne("StokuQmimiProduktit")
                        .HasForeignKey("WebAPI.Models.StokuQmimiProduktit", "ProduktiId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Produkti");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatEPorosis", b =>
                {
                    b.HasOne("WebAPI.Models.Porosit", "Porosia")
                        .WithMany("TeDhenatEPorosis")
                        .HasForeignKey("IdPorosia");

                    b.HasOne("WebAPI.Models.Produkti", "Produkti")
                        .WithMany("TeDhenatEPorosis")
                        .HasForeignKey("IdProdukti");

                    b.Navigation("Porosia");

                    b.Navigation("Produkti");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatPerdoruesit", b =>
                {
                    b.HasOne("WebAPI.Models.Perdoruesi", "User")
                        .WithOne("TeDhenatPerdoruesit")
                        .HasForeignKey("WebAPI.Models.TeDhenatPerdoruesit", "UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatRegjistrimit", b =>
                {
                    b.HasOne("WebAPI.Models.Produkti", "Produkti")
                        .WithMany("TeDhenatRegjistrimit")
                        .HasForeignKey("IdProduktit");

                    b.HasOne("WebAPI.Models.RegjistrimiStokut", "Regjistrimi")
                        .WithMany("TeDhenatRegjistrimit")
                        .HasForeignKey("IdRegjistrimit");

                    b.Navigation("Produkti");

                    b.Navigation("Regjistrimi");
                });

            modelBuilder.Entity("WebAPI.Models.ZbritjaQmimitProduktit", b =>
                {
                    b.HasOne("WebAPI.Models.Produkti", "Produkti")
                        .WithOne("ZbritjaQmimitProduktit")
                        .HasForeignKey("WebAPI.Models.ZbritjaQmimitProduktit", "ProduktiId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Produkti");
                });

            modelBuilder.Entity("WebAPI.Models.KategoriaProduktit", b =>
                {
                    b.Navigation("Produkti");
                });

            modelBuilder.Entity("WebAPI.Models.Kompania", b =>
                {
                    b.Navigation("Produkti");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Banka57449", b =>
                {
                    b.Navigation("Personi57449");
                });

            modelBuilder.Entity("WebAPI.Models.MbrojtjaEProjektit.Planet212257449", b =>
                {
                    b.Navigation("Satellite");
                });

            modelBuilder.Entity("WebAPI.Models.Perdoruesi", b =>
                {
                    b.Navigation("ContactForm");

                    b.Navigation("Porosit");

                    b.Navigation("RegjistrimiStokut");

                    b.Navigation("TeDhenatPerdoruesit");
                });

            modelBuilder.Entity("WebAPI.Models.Porosit", b =>
                {
                    b.Navigation("TeDhenatEPorosis");
                });

            modelBuilder.Entity("WebAPI.Models.Produkti", b =>
                {
                    b.Navigation("KodiZbritjes");

                    b.Navigation("StokuQmimiProduktit");

                    b.Navigation("TeDhenatEPorosis");

                    b.Navigation("TeDhenatRegjistrimit");

                    b.Navigation("ZbritjaQmimitProduktit");
                });

            modelBuilder.Entity("WebAPI.Models.RegjistrimiStokut", b =>
                {
                    b.Navigation("TeDhenatRegjistrimit");
                });

            modelBuilder.Entity("WebAPI.Models.Team", b =>
                {
                    b.Navigation("Player");
                });
#pragma warning restore 612, 618
        }
    }
}
