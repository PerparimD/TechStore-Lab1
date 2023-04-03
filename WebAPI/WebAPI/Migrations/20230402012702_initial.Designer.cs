﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using WebAPI.Models;

#nullable disable

namespace WebAPI.Migrations
{
    [DbContext(typeof(TechStoreDbContext))]
    [Migration("20230402012702_initial")]
    partial class initial
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("WebAPI.Models.ContactForm", b =>
                {
                    b.Property<int>("MesazhiId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("mesazhiID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("MesazhiId"));

                    b.Property<DateTime?>("DataDergeses")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("date")
                        .HasColumnName("dataDergeses")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<string>("Mesazhi")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("mesazhi");

                    b.Property<string>("Statusi")
                        .ValueGeneratedOnAdd()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("statusi")
                        .HasDefaultValueSql("('Mesazhi juaj eshte derguar tek Stafi')");

                    b.Property<int?>("UserId")
                        .HasColumnType("int")
                        .HasColumnName("userID");

                    b.HasKey("MesazhiId")
                        .HasName("PK__ContactF__0E3F7CF3731C8CDE");

                    b.HasIndex("UserId");

                    b.ToTable("ContactForm", (string)null);
                });

            modelBuilder.Entity("WebAPI.Models.KategoriaProduktit", b =>
                {
                    b.Property<int>("KategoriaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("kategoriaID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KategoriaId"));

                    b.Property<string>("LlojiKategoris")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("llojiKategoris");

                    b.Property<string>("PershkrimiKategoris")
                        .HasColumnType("text")
                        .HasColumnName("pershkrimiKategoris");

                    b.HasKey("KategoriaId")
                        .HasName("PK__Kategori__AC39DE2ACE8BCA8A");

                    b.ToTable("KategoriaProduktit", (string)null);
                });

            modelBuilder.Entity("WebAPI.Models.KodiZbritje", b =>
                {
                    b.Property<string>("Kodi")
                        .HasMaxLength(6)
                        .IsUnicode(false)
                        .HasColumnType("char(6)")
                        .HasColumnName("kodi")
                        .IsFixedLength();

                    b.Property<DateTime?>("DataKrijimit")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("date")
                        .HasColumnName("dataKrijimit")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<int?>("IdProdukti")
                        .HasColumnType("int")
                        .HasColumnName("idProdukti");

                    b.Property<decimal>("QmimiZbritjes")
                        .HasColumnType("decimal(18, 2)")
                        .HasColumnName("qmimiZbritjes");

                    b.HasKey("Kodi")
                        .HasName("PK__KodiZbri__25A8748FB3E013A8");

                    b.HasIndex("IdProdukti");

                    b.ToTable("KodiZbritjes");
                });

            modelBuilder.Entity("WebAPI.Models.Kompanium", b =>
                {
                    b.Property<int>("KompaniaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("kompaniaID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KompaniaId"));

                    b.Property<string>("Adresa")
                        .HasMaxLength(40)
                        .IsUnicode(false)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("adresa");

                    b.Property<string>("EmriKompanis")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("emriKompanis");

                    b.Property<string>("Logo")
                        .ValueGeneratedOnAdd()
                        .HasMaxLength(40)
                        .IsUnicode(false)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("logo")
                        .HasDefaultValueSql("('kompaniPaFoto.png')");

                    b.HasKey("KompaniaId")
                        .HasName("PK__Kompania__2026D74DCB37AA9A");

                    b.ToTable("Kompania");
                });

            modelBuilder.Entity("WebAPI.Models.Perdoruesi", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("userID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("UserId"));

                    b.Property<int?>("Aksesi")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("aksesi")
                        .HasDefaultValueSql("((0))");

                    b.Property<string>("Email")
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("email");

                    b.Property<string>("Emri")
                        .IsRequired()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("emri");

                    b.Property<string>("Mbimeri")
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("mbimeri");

                    b.Property<string>("UserPw")
                        .IsRequired()
                        .HasMaxLength(70)
                        .IsUnicode(false)
                        .HasColumnType("varchar(70)")
                        .HasColumnName("userPW");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasMaxLength(20)
                        .IsUnicode(false)
                        .HasColumnType("varchar(20)")
                        .HasColumnName("username");

                    b.HasKey("UserId")
                        .HasName("PK__Perdorue__CB9A1CDFC4C4A0AA");

                    b.HasIndex(new[] { "Username" }, "UQ__Perdorue__F3DBC5728A6B6DAE")
                        .IsUnique();

                    b.ToTable("Perdoruesi", (string)null);
                });

            modelBuilder.Entity("WebAPI.Models.Porosit", b =>
                {
                    b.Property<int>("IdPorosia")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("idPorosia");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdPorosia"));

                    b.Property<DateTime?>("DataPorosis")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("date")
                        .HasColumnName("dataPorosis")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<int?>("IdKlienti")
                        .HasColumnType("int")
                        .HasColumnName("idKlienti");

                    b.Property<string>("StatusiPorosis")
                        .ValueGeneratedOnAdd()
                        .HasMaxLength(30)
                        .IsUnicode(false)
                        .HasColumnType("varchar(30)")
                        .HasColumnName("statusiPorosis")
                        .HasDefaultValueSql("('Ne Procesim')");

                    b.Property<decimal>("TotaliPorosis")
                        .HasColumnType("decimal(18, 2)")
                        .HasColumnName("totaliPorosis");

                    b.HasKey("IdPorosia")
                        .HasName("PK__Porosit__A9F27D2AB271ADFC");

                    b.HasIndex("IdKlienti");

                    b.ToTable("Porosit", (string)null);
                });

            modelBuilder.Entity("WebAPI.Models.Produkti", b =>
                {
                    b.Property<int>("ProduktiId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("produktiID");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ProduktiId"));

                    b.Property<string>("EmriProduktit")
                        .IsRequired()
                        .HasColumnType("text")
                        .HasColumnName("emriProduktit");

                    b.Property<string>("FotoProduktit")
                        .ValueGeneratedOnAdd()
                        .HasMaxLength(40)
                        .IsUnicode(false)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("fotoProduktit")
                        .HasDefaultValueSql("('produktPaFoto.png')");

                    b.Property<int?>("KategoriaId")
                        .HasColumnType("int")
                        .HasColumnName("kategoriaID");

                    b.Property<int?>("KompaniaId")
                        .HasColumnType("int")
                        .HasColumnName("kompaniaID");

                    b.Property<string>("Pershkrimi")
                        .HasColumnType("text")
                        .HasColumnName("pershkrimi");

                    b.Property<decimal>("QmimiProduktit")
                        .HasColumnType("decimal(18, 2)")
                        .HasColumnName("qmimiProduktit");

                    b.HasKey("ProduktiId")
                        .HasName("PK__Produkti__76A3DFCF91A50347");

                    b.HasIndex("KategoriaId");

                    b.HasIndex("KompaniaId");

                    b.ToTable("Produkti", (string)null);
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatEporosi", b =>
                {
                    b.Property<int>("IdDetajet")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("idDetajet");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("IdDetajet"));

                    b.Property<int>("IdPorosia")
                        .HasColumnType("int")
                        .HasColumnName("idPorosia");

                    b.Property<int?>("IdProdukti")
                        .HasColumnType("int")
                        .HasColumnName("idProdukti");

                    b.Property<string>("KodiZbritjes")
                        .HasMaxLength(6)
                        .IsUnicode(false)
                        .HasColumnType("char(6)")
                        .HasColumnName("kodiZbritjes")
                        .IsFixedLength();

                    b.Property<decimal>("QmimiTotal")
                        .HasColumnType("decimal(18, 2)")
                        .HasColumnName("qmimiTotal");

                    b.Property<int>("SasiaPorositur")
                        .HasColumnType("int")
                        .HasColumnName("sasiaPorositur");

                    b.HasKey("IdDetajet")
                        .HasName("PK__TeDhenat__494F491F84D65D51");

                    b.HasIndex("IdPorosia");

                    b.HasIndex("IdProdukti");

                    b.HasIndex("KodiZbritjes");

                    b.ToTable("TeDhenatEPorosis", (string)null);
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatPerdoruesit", b =>
                {
                    b.Property<int>("UserId")
                        .HasColumnType("int")
                        .HasColumnName("userID");

                    b.Property<string>("Adresa")
                        .HasMaxLength(40)
                        .IsUnicode(false)
                        .HasColumnType("varchar(40)")
                        .HasColumnName("adresa");

                    b.Property<string>("NrKontaktit")
                        .HasMaxLength(15)
                        .IsUnicode(false)
                        .HasColumnType("varchar(15)")
                        .HasColumnName("nrKontaktit");

                    b.Property<string>("Qyteti")
                        .HasMaxLength(20)
                        .IsUnicode(false)
                        .HasColumnType("varchar(20)")
                        .HasColumnName("qyteti");

                    b.Property<int?>("ZipKodi")
                        .HasColumnType("int")
                        .HasColumnName("zipKodi");

                    b.HasKey("UserId");

                    b.ToTable("TeDhenatPerdoruesit", (string)null);
                });

            modelBuilder.Entity("WebAPI.Models.ContactForm", b =>
                {
                    b.HasOne("WebAPI.Models.Perdoruesi", "User")
                        .WithMany("ContactForms")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.SetNull)
                        .HasConstraintName("FK_ContactForm_Perdoruesi");

                    b.Navigation("User");
                });

            modelBuilder.Entity("WebAPI.Models.KodiZbritje", b =>
                {
                    b.HasOne("WebAPI.Models.Produkti", "IdProduktiNavigation")
                        .WithMany("KodiZbritjes")
                        .HasForeignKey("IdProdukti")
                        .OnDelete(DeleteBehavior.SetNull)
                        .HasConstraintName("FK_KodiZbritjes_Produkti");

                    b.Navigation("IdProduktiNavigation");
                });

            modelBuilder.Entity("WebAPI.Models.Porosit", b =>
                {
                    b.HasOne("WebAPI.Models.Perdoruesi", "IdKlientiNavigation")
                        .WithMany("Porosits")
                        .HasForeignKey("IdKlienti")
                        .OnDelete(DeleteBehavior.SetNull)
                        .HasConstraintName("FK_Porosit_Klienti");

                    b.Navigation("IdKlientiNavigation");
                });

            modelBuilder.Entity("WebAPI.Models.Produkti", b =>
                {
                    b.HasOne("WebAPI.Models.KategoriaProduktit", "Kategoria")
                        .WithMany("Produktis")
                        .HasForeignKey("KategoriaId")
                        .OnDelete(DeleteBehavior.SetNull)
                        .HasConstraintName("FK_Produkti_Kategoria");

                    b.HasOne("WebAPI.Models.Kompanium", "Kompania")
                        .WithMany("Produktis")
                        .HasForeignKey("KompaniaId")
                        .OnDelete(DeleteBehavior.SetNull)
                        .HasConstraintName("FK_Produkti_Kompania");

                    b.Navigation("Kategoria");

                    b.Navigation("Kompania");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatEporosi", b =>
                {
                    b.HasOne("WebAPI.Models.Porosit", "IdPorosiaNavigation")
                        .WithMany("TeDhenatEporosis")
                        .HasForeignKey("IdPorosia")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK_TeDhenatPorosis_Porosia");

                    b.HasOne("WebAPI.Models.Produkti", "IdProduktiNavigation")
                        .WithMany("TeDhenatEporosis")
                        .HasForeignKey("IdProdukti")
                        .OnDelete(DeleteBehavior.SetNull)
                        .HasConstraintName("FK_TeDhenatPorosis_Produkti");

                    b.HasOne("WebAPI.Models.KodiZbritje", "KodiZbritjesNavigation")
                        .WithMany("TeDhenatEporosis")
                        .HasForeignKey("KodiZbritjes")
                        .HasConstraintName("FK_TeDhenatPorosis_KodiZbritjes");

                    b.Navigation("IdPorosiaNavigation");

                    b.Navigation("IdProduktiNavigation");

                    b.Navigation("KodiZbritjesNavigation");
                });

            modelBuilder.Entity("WebAPI.Models.TeDhenatPerdoruesit", b =>
                {
                    b.HasOne("WebAPI.Models.Perdoruesi", "User")
                        .WithOne("TeDhenatPerdoruesit")
                        .HasForeignKey("WebAPI.Models.TeDhenatPerdoruesit", "UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK_TeDhenatPerdorues_Perdoruesi");

                    b.Navigation("User");
                });

            modelBuilder.Entity("WebAPI.Models.KategoriaProduktit", b =>
                {
                    b.Navigation("Produktis");
                });

            modelBuilder.Entity("WebAPI.Models.KodiZbritje", b =>
                {
                    b.Navigation("TeDhenatEporosis");
                });

            modelBuilder.Entity("WebAPI.Models.Kompanium", b =>
                {
                    b.Navigation("Produktis");
                });

            modelBuilder.Entity("WebAPI.Models.Perdoruesi", b =>
                {
                    b.Navigation("ContactForms");

                    b.Navigation("Porosits");

                    b.Navigation("TeDhenatPerdoruesit");
                });

            modelBuilder.Entity("WebAPI.Models.Porosit", b =>
                {
                    b.Navigation("TeDhenatEporosis");
                });

            modelBuilder.Entity("WebAPI.Models.Produkti", b =>
                {
                    b.Navigation("KodiZbritjes");

                    b.Navigation("TeDhenatEporosis");
                });
#pragma warning restore 612, 618
        }
    }
}