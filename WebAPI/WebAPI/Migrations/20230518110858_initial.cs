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
                    llojiKategoris = table.Column<string>(type: "text", nullable: true),
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
                    emriKompanis = table.Column<string>(type: "text", nullable: true),
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
                    emri = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true),
                    mbiemri = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true),
                    email = table.Column<string>(type: "varchar(30)", unicode: false, maxLength: 30, nullable: true),
                    username = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: true),
                    userPW = table.Column<string>(type: "varchar(70)", unicode: false, maxLength: 70, nullable: true),
                    aksesi = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((0))")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Perdorue__CB9A1CDFC4C4A0AA", x => x.userID);
                });

            migrationBuilder.CreateTable(
                name: "RoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RoleClaims", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserClaims", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserLogins",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ProviderKey = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLogins", x => x.UserId);
                });

            migrationBuilder.CreateTable(
                name: "UserRoles",
                columns: table => new
                {
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserRoles", x => x.RoleId);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserTokens",
                columns: table => new
                {
                    Value = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LoginProvider = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserTokens", x => x.Value);
                });

            migrationBuilder.CreateTable(
                name: "Produkti",
                columns: table => new
                {
                    produktiID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    emriProduktit = table.Column<string>(type: "text", nullable: true),
                    pershkrimi = table.Column<string>(type: "text", nullable: true),
                    fotoProduktit = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true, defaultValueSql: "('produktPaFoto.png')"),
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
                    mesazhi = table.Column<string>(type: "text", nullable: true),
                    dataDergeses = table.Column<DateTime>(type: "date", nullable: true, defaultValueSql: "(getdate())"),
                    statusi = table.Column<string>(type: "varchar(60)", unicode: false, maxLength: 60, nullable: true, defaultValueSql: "('Mesazhi juaj eshte derguar tek Stafi')"),
                    emri = table.Column<string>(type: "varchar(250)", unicode: false, maxLength: 250, nullable: true),
                    email = table.Column<string>(type: "varchar(250)", unicode: false, maxLength: 250, nullable: true)
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
                    totaliPorosis = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
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
                name: "RegjistrimiStokut",
                columns: table => new
                {
                    idRegjistrimit = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    dataRegjistrimit = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    stafiID = table.Column<int>(type: "int", nullable: true),
                    totaliProdukteveRegjistruara = table.Column<int>(type: "int", nullable: true),
                    shumaTotaleRegjistrimit = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    shumaTotaleBlerese = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RegjistrimiStokut", x => x.idRegjistrimit);
                    table.ForeignKey(
                        name: "FK_Regjistrimi_Perdoruesi",
                        column: x => x.stafiID,
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
                    kodi = table.Column<string>(type: "varchar(12)", unicode: false, maxLength: 12, nullable: false),
                    dataKrijimit = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    qmimiZbritjes = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
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
                name: "StokuQmimiProduktit",
                columns: table => new
                {
                    produktiID = table.Column<int>(type: "int", nullable: false),
                    sasiaNeStok = table.Column<int>(type: "int", nullable: true, defaultValueSql: "((0))"),
                    qmimiBleres = table.Column<decimal>(type: "decimal(18,2)", nullable: true, defaultValueSql: "((0))"),
                    qmimiProduktit = table.Column<decimal>(type: "decimal(18,2)", nullable: true, defaultValueSql: "((0))"),
                    dataKrijimit = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    dataPerditsimit = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StokuProduktit", x => x.produktiID);
                    table.ForeignKey(
                        name: "FK_StokuQmimiProduktit_Produkti_produktiID",
                        column: x => x.produktiID,
                        principalTable: "Produkti",
                        principalColumn: "produktiID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ZbritjaQmimitProduktit",
                columns: table => new
                {
                    produktiID = table.Column<int>(type: "int", nullable: false),
                    qmimiPaZbritjeProduktit = table.Column<decimal>(type: "decimal(18,2)", nullable: true, defaultValueSql: "((0))"),
                    qmimiMeZbritjeProduktit = table.Column<decimal>(type: "decimal(18,2)", nullable: true, defaultValueSql: "((0))"),
                    dataZbritjes = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())"),
                    dataSkadimit = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ZbritjaQmimitProduktit", x => x.produktiID);
                    table.ForeignKey(
                        name: "FK_ZbritjaQmimitProduktit_Produkti_produktiID",
                        column: x => x.produktiID,
                        principalTable: "Produkti",
                        principalColumn: "produktiID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TeDhenatRegjistrimit",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    idRegjistrimit = table.Column<int>(type: "int", nullable: true),
                    idProduktit = table.Column<int>(type: "int", nullable: true),
                    sasiaStokut = table.Column<int>(type: "int", nullable: true),
                    qmimiBleres = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    qmimiShites = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeDhenatRegjistrimit", x => x.id);
                    table.ForeignKey(
                        name: "FK_Produkti_TeDhenatRegjistrimit",
                        column: x => x.idProduktit,
                        principalTable: "Produkti",
                        principalColumn: "produktiID",
                        onDelete: ReferentialAction.SetNull);
                    table.ForeignKey(
                        name: "FK_RegjistrimiStokut_TeDhenatRegjistrimit",
                        column: x => x.idRegjistrimit,
                        principalTable: "RegjistrimiStokut",
                        principalColumn: "idRegjistrimit",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TeDhenatEPorosis",
                columns: table => new
                {
                    idDetajet = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    qmimiTotal = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    sasiaPorositur = table.Column<int>(type: "int", nullable: true),
                    idPorosia = table.Column<int>(type: "int", nullable: true),
                    idProdukti = table.Column<int>(type: "int", nullable: true),
                    kodiZbritjes = table.Column<string>(type: "varchar(12)", unicode: false, maxLength: 12, nullable: true)
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
                unique: true,
                filter: "[username] IS NOT NULL");

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
                name: "IX_RegjistrimiStokut_stafiID",
                table: "RegjistrimiStokut",
                column: "stafiID");

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

            migrationBuilder.CreateIndex(
                name: "IX_TeDhenatRegjistrimit_idProduktit",
                table: "TeDhenatRegjistrimit",
                column: "idProduktit");

            migrationBuilder.CreateIndex(
                name: "IX_TeDhenatRegjistrimit_idRegjistrimit",
                table: "TeDhenatRegjistrimit",
                column: "idRegjistrimit");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ContactForm");

            migrationBuilder.DropTable(
                name: "RoleClaims");

            migrationBuilder.DropTable(
                name: "Roles");

            migrationBuilder.DropTable(
                name: "StokuQmimiProduktit");

            migrationBuilder.DropTable(
                name: "TeDhenatEPorosis");

            migrationBuilder.DropTable(
                name: "TeDhenatPerdoruesit");

            migrationBuilder.DropTable(
                name: "TeDhenatRegjistrimit");

            migrationBuilder.DropTable(
                name: "UserClaims");

            migrationBuilder.DropTable(
                name: "UserLogins");

            migrationBuilder.DropTable(
                name: "UserRoles");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "UserTokens");

            migrationBuilder.DropTable(
                name: "ZbritjaQmimitProduktit");

            migrationBuilder.DropTable(
                name: "KodiZbritjes");

            migrationBuilder.DropTable(
                name: "Porosit");

            migrationBuilder.DropTable(
                name: "RegjistrimiStokut");

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
