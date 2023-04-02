using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "KategoriaProduktit",
                columns: table => new
                {
                    kategoriaID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    llojiKategoris = table.Column<string>(type: "text", nullable: false),
                    pershkrimiKategoris = table.Column<string>(type: "text", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Kategori__AC39DE2ACE8BCA8A", x => x.kategoriaID);
                });

            migrationBuilder.CreateTable(
                name: "Kompania",
                columns: table => new
                {
                    kompaniaID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    emriKompanis = table.Column<string>(type: "text", nullable: false),
                    logo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true, defaultValueSql: "('kompaniPaFoto.png')"),
                    adresa = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Kompania__2026D74DCB37AA9A", x => x.kompaniaID);
                });

            migrationBuilder.CreateTable(
                name: "Perdoruesi",
                columns: table => new
                {
                    userID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    emri = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: false),
                    mbimeri = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true),
                    email = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true),
                    username = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: false),
                    userPW = table.Column<string>(type: "varchar(70)", unicode: false, maxLength: 70, nullable: false),
                    aksesi = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((0))")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Perdorue__CB9A1CDFC4C4A0AA", x => x.userID);
                });

            migrationBuilder.CreateTable(
                name: "Produkti",
                columns: table => new
                {
                    produktiID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    emriProduktit = table.Column<string>(type: "text", nullable: false),
                    pershkrimi = table.Column<string>(type: "text", nullable: true),
                    fotoProduktit = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true, defaultValueSql: "('produktPaFoto.png')"),
                    qmimiProduktit = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    kompaniaID = table.Column<int>(type: "int", nullable: true),
                    kategoriaID = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Produkti__76A3DFCF91A50347", x => x.produktiID);
                    table.ForeignKey(
                        name: "FK_Produkti_Kategoria",
                        column: x => x.kategoriaID,
                        principalTable: "KategoriaProduktit",
                        principalColumn: "kategoriaID",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_Produkti_Kompania",
                        column: x => x.kompaniaID,
                        principalTable: "Kompania",
                        principalColumn: "kompaniaID",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "ContactForm",
                columns: table => new
                {
                    mesazhiID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    userID = table.Column<int>(type: "int", nullable: true),
                    mesazhi = table.Column<string>(type: "text", nullable: false),
                    dataDergeses = table.Column<DateTime>(type: "date", nullable: true, defaultValueSql: "(getdate())"),
                    statusi = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true, defaultValueSql: "('Mesazhi juaj eshte derguar tek Stafi')")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__ContactF__0E3F7CF3731C8CDE", x => x.mesazhiID);
                    table.ForeignKey(
                        name: "FK_ContactForm_Perdoruesi",
                        column: x => x.userID,
                        principalTable: "Perdoruesi",
                        principalColumn: "userID",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "Porosit",
                columns: table => new
                {
                    idPorosia = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    totaliPorosis = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    dataPorosis = table.Column<DateTime>(type: "date", nullable: true, defaultValueSql: "(getdate())"),
                    statusiPorosis = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true, defaultValueSql: "('Ne Procesim')"),
                    idKlienti = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Porosit__A9F27D2AB271ADFC", x => x.idPorosia);
                    table.ForeignKey(
                        name: "FK_Porosit_Klienti",
                        column: x => x.idKlienti,
                        principalTable: "Perdoruesi",
                        principalColumn: "userID",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "TeDhenatPerdoruesit",
                columns: table => new
                {
                    userID = table.Column<int>(type: "int", nullable: false),
                    nrKontaktit = table.Column<string>(type: "varchar(15)", unicode: false, maxLength: 15, nullable: true),
                    qyteti = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: true),
                    zipKodi = table.Column<int>(type: "int", nullable: true),
                    adresa = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeDhenatPerdoruesit", x => x.userID);
                    table.ForeignKey(
                        name: "FK_TeDhenatPerdorues_Perdoruesi",
                        column: x => x.userID,
                        principalTable: "Perdoruesi",
                        principalColumn: "userID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "KodiZbritjes",
                columns: table => new
                {
                    kodi = table.Column<string>(type: "char(6)", unicode: false, fixedLength: true, maxLength: 6, nullable: false),
                    dataKrijimit = table.Column<DateTime>(type: "date", nullable: true, defaultValueSql: "(getdate())"),
                    qmimiZbritjes = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    idProdukti = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__KodiZbri__25A8748FB3E013A8", x => x.kodi);
                    table.ForeignKey(
                        name: "FK_KodiZbritjes_Produkti",
                        column: x => x.idProdukti,
                        principalTable: "Produkti",
                        principalColumn: "produktiID",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateTable(
                name: "TeDhenatEPorosis",
                columns: table => new
                {
                    idDetajet = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    qmimiTotal = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    sasiaPorositur = table.Column<int>(type: "int", nullable: false),
                    idPorosia = table.Column<int>(type: "int", nullable: false),
                    idProdukti = table.Column<int>(type: "int", nullable: true),
                    kodiZbritjes = table.Column<string>(type: "char(6)", unicode: false, fixedLength: true, maxLength: 6, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__TeDhenat__494F491F84D65D51", x => x.idDetajet);
                    table.ForeignKey(
                        name: "FK_TeDhenatPorosis_KodiZbritjes",
                        column: x => x.kodiZbritjes,
                        principalTable: "KodiZbritjes",
                        principalColumn: "kodi");
                    table.ForeignKey(
                        name: "FK_TeDhenatPorosis_Porosia",
                        column: x => x.idPorosia,
                        principalTable: "Porosit",
                        principalColumn: "idPorosia",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TeDhenatPorosis_Produkti",
                        column: x => x.idProdukti,
                        principalTable: "Produkti",
                        principalColumn: "produktiID",
                        onDelete: ReferentialAction.SetNull);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ContactForm_userID",
                table: "ContactForm",
                column: "userID");

            migrationBuilder.CreateIndex(
                name: "IX_KodiZbritjes_idProdukti",
                table: "KodiZbritjes",
                column: "idProdukti");

            migrationBuilder.CreateIndex(
                name: "UQ__Perdorue__F3DBC5728A6B6DAE",
                table: "Perdoruesi",
                column: "username",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Porosit_idKlienti",
                table: "Porosit",
                column: "idKlienti");

            migrationBuilder.CreateIndex(
                name: "IX_Produkti_kategoriaID",
                table: "Produkti",
                column: "kategoriaID");

            migrationBuilder.CreateIndex(
                name: "IX_Produkti_kompaniaID",
                table: "Produkti",
                column: "kompaniaID");

            migrationBuilder.CreateIndex(
                name: "IX_TeDhenatEPorosis_idPorosia",
                table: "TeDhenatEPorosis",
                column: "idPorosia");

            migrationBuilder.CreateIndex(
                name: "IX_TeDhenatEPorosis_idProdukti",
                table: "TeDhenatEPorosis",
                column: "idProdukti");

            migrationBuilder.CreateIndex(
                name: "IX_TeDhenatEPorosis_kodiZbritjes",
                table: "TeDhenatEPorosis",
                column: "kodiZbritjes");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ContactForm");

            migrationBuilder.DropTable(
                name: "TeDhenatEPorosis");

            migrationBuilder.DropTable(
                name: "TeDhenatPerdoruesit");

            migrationBuilder.DropTable(
                name: "KodiZbritjes");

            migrationBuilder.DropTable(
                name: "Porosit");

            migrationBuilder.DropTable(
                name: "Produkti");

            migrationBuilder.DropTable(
                name: "Perdoruesi");

            migrationBuilder.DropTable(
                name: "KategoriaProduktit");

            migrationBuilder.DropTable(
                name: "Kompania");
        }
    }
}
