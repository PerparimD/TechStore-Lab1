using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class Identity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "UQ__Perdorue__F3DBC5728A6B6DAE",
                table: "Perdoruesi");

            migrationBuilder.DropColumn(
                name: "qmimiProduktit",
                table: "Produkti");

            migrationBuilder.RenameColumn(
                name: "mbimeri",
                table: "Perdoruesi",
                newName: "mbiemri");

            migrationBuilder.AlterColumn<int>(
                name: "sasiaPorositur",
                table: "TeDhenatEPorosis",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<decimal>(
                name: "qmimiTotal",
                table: "TeDhenatEPorosis",
                type: "decimal(18,2)",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");

            migrationBuilder.AlterColumn<string>(
                name: "kodiZbritjes",
                table: "TeDhenatEPorosis",
                type: "varchar(12)",
                unicode: false,
                maxLength: 12,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "char(6)",
                oldUnicode: false,
                oldFixedLength: true,
                oldMaxLength: 6,
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "idPorosia",
                table: "TeDhenatEPorosis",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<string>(
                name: "emriProduktit",
                table: "Produkti",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<decimal>(
                name: "totaliPorosis",
                table: "Porosit",
                type: "decimal(18,2)",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");

            migrationBuilder.AlterColumn<string>(
                name: "username",
                table: "Perdoruesi",
                type: "varchar(20)",
                unicode: false,
                maxLength: 20,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(20)",
                oldUnicode: false,
                oldMaxLength: 20);

            migrationBuilder.AlterColumn<string>(
                name: "userPW",
                table: "Perdoruesi",
                type: "varchar(70)",
                unicode: false,
                maxLength: 70,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(70)",
                oldUnicode: false,
                oldMaxLength: 70);

            migrationBuilder.AlterColumn<string>(
                name: "emri",
                table: "Perdoruesi",
                type: "varchar(30)",
                unicode: false,
                maxLength: 30,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(30)",
                oldUnicode: false,
                oldMaxLength: 30);

            migrationBuilder.AlterColumn<string>(
                name: "emriKompanis",
                table: "Kompania",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<decimal>(
                name: "qmimiZbritjes",
                table: "KodiZbritjes",
                type: "decimal(18,2)",
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");

            migrationBuilder.AlterColumn<DateTime>(
                name: "dataKrijimit",
                table: "KodiZbritjes",
                type: "datetime",
                nullable: true,
                defaultValueSql: "(getdate())",
                oldClrType: typeof(DateTime),
                oldType: "date",
                oldNullable: true,
                oldDefaultValueSql: "(getdate())");

            migrationBuilder.AlterColumn<string>(
                name: "kodi",
                table: "KodiZbritjes",
                type: "varchar(12)",
                unicode: false,
                maxLength: 12,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "char(6)",
                oldUnicode: false,
                oldFixedLength: true,
                oldMaxLength: 6);

            migrationBuilder.AlterColumn<string>(
                name: "llojiKategoris",
                table: "KategoriaProduktit",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "statusi",
                table: "ContactForm",
                type: "varchar(60)",
                unicode: false,
                maxLength: 60,
                nullable: true,
                defaultValueSql: "('Mesazhi juaj eshte derguar tek Stafi')",
                oldClrType: typeof(string),
                oldType: "varchar(50)",
                oldUnicode: false,
                oldMaxLength: 50,
                oldNullable: true,
                oldDefaultValueSql: "('Mesazhi juaj eshte derguar tek Stafi')");

            migrationBuilder.AlterColumn<string>(
                name: "mesazhi",
                table: "ContactForm",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AddColumn<string>(
                name: "email",
                table: "ContactForm",
                type: "varchar(250)",
                unicode: false,
                maxLength: 250,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "emri",
                table: "ContactForm",
                type: "varchar(250)",
                unicode: false,
                maxLength: 250,
                nullable: true);

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
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
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
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

            migrationBuilder.CreateIndex(
                name: "UQ__Perdorue__F3DBC5728A6B6DAE",
                table: "Perdoruesi",
                column: "username",
                unique: true,
                filter: "[username] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_RegjistrimiStokut_stafiID",
                table: "RegjistrimiStokut",
                column: "stafiID");

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
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "StokuQmimiProduktit");

            migrationBuilder.DropTable(
                name: "TeDhenatRegjistrimit");

            migrationBuilder.DropTable(
                name: "ZbritjaQmimitProduktit");

            migrationBuilder.DropTable(
                name: "RegjistrimiStokut");

            migrationBuilder.DropIndex(
                name: "UQ__Perdorue__F3DBC5728A6B6DAE",
                table: "Perdoruesi");

            migrationBuilder.DropColumn(
                name: "email",
                table: "ContactForm");

            migrationBuilder.DropColumn(
                name: "emri",
                table: "ContactForm");

            migrationBuilder.RenameColumn(
                name: "mbiemri",
                table: "Perdoruesi",
                newName: "mbimeri");

            migrationBuilder.AlterColumn<int>(
                name: "sasiaPorositur",
                table: "TeDhenatEPorosis",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "qmimiTotal",
                table: "TeDhenatEPorosis",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "kodiZbritjes",
                table: "TeDhenatEPorosis",
                type: "char(6)",
                unicode: false,
                fixedLength: true,
                maxLength: 6,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "varchar(12)",
                oldUnicode: false,
                oldMaxLength: 12,
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "idPorosia",
                table: "TeDhenatEPorosis",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "emriProduktit",
                table: "Produkti",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "qmimiProduktit",
                table: "Produkti",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AlterColumn<decimal>(
                name: "totaliPorosis",
                table: "Porosit",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "username",
                table: "Perdoruesi",
                type: "varchar(20)",
                unicode: false,
                maxLength: 20,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "varchar(20)",
                oldUnicode: false,
                oldMaxLength: 20,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "userPW",
                table: "Perdoruesi",
                type: "varchar(70)",
                unicode: false,
                maxLength: 70,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "varchar(70)",
                oldUnicode: false,
                oldMaxLength: 70,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "emri",
                table: "Perdoruesi",
                type: "varchar(30)",
                unicode: false,
                maxLength: 30,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "varchar(30)",
                oldUnicode: false,
                oldMaxLength: 30,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "emriKompanis",
                table: "Kompania",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);

            migrationBuilder.AlterColumn<decimal>(
                name: "qmimiZbritjes",
                table: "KodiZbritjes",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "dataKrijimit",
                table: "KodiZbritjes",
                type: "date",
                nullable: true,
                defaultValueSql: "(getdate())",
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true,
                oldDefaultValueSql: "(getdate())");

            migrationBuilder.AlterColumn<string>(
                name: "kodi",
                table: "KodiZbritjes",
                type: "char(6)",
                unicode: false,
                fixedLength: true,
                maxLength: 6,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "varchar(12)",
                oldUnicode: false,
                oldMaxLength: 12);

            migrationBuilder.AlterColumn<string>(
                name: "llojiKategoris",
                table: "KategoriaProduktit",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "statusi",
                table: "ContactForm",
                type: "varchar(50)",
                unicode: false,
                maxLength: 50,
                nullable: true,
                defaultValueSql: "('Mesazhi juaj eshte derguar tek Stafi')",
                oldClrType: typeof(string),
                oldType: "varchar(60)",
                oldUnicode: false,
                oldMaxLength: 60,
                oldNullable: true,
                oldDefaultValueSql: "('Mesazhi juaj eshte derguar tek Stafi')");

            migrationBuilder.AlterColumn<string>(
                name: "mesazhi",
                table: "ContactForm",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "UQ__Perdorue__F3DBC5728A6B6DAE",
                table: "Perdoruesi",
                column: "username",
                unique: true);
        }
    }
}
