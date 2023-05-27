using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class Krijimi_teDhenaveBiznesit : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TeDhenatPorosis_KodiZbritjes",
                table: "TeDhenatEPorosis");

            migrationBuilder.DropIndex(
                name: "IX_TeDhenatEPorosis_kodiZbritjes",
                table: "TeDhenatEPorosis");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "73e79d6d-e66c-4815-9e21-a47c91b0e243");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "770c0648-d274-459c-9bfc-211ad071fc01");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "b45b7653-2652-4dd2-a128-ffe9fa4f55e8");

            migrationBuilder.DropColumn(
                name: "kodiZbritjes",
                table: "TeDhenatEPorosis");

            migrationBuilder.AddColumn<string>(
                name: "Shteti",
                table: "TeDhenatPerdoruesit",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "qmimiProduktit",
                table: "TeDhenatEPorosis",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "totaliProdukteve",
                table: "Porosit",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "zbritja",
                table: "Porosit",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "AspNetUserID",
                table: "Perdoruesi",
                type: "nvarchar(450)",
                maxLength: 450,
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldMaxLength: 450);

            migrationBuilder.CreateTable(
                name: "TeDhenatBiznesit",
                columns: table => new
                {
                    IDTeDhenatBiznesit = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    EmriIBiznesit = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ShkurtesaEmritBiznesit = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NUI = table.Column<int>(type: "int", nullable: true),
                    NF = table.Column<int>(type: "int", nullable: true),
                    NRTVSH = table.Column<int>(type: "int", nullable: true),
                    Adresa = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NrKontaktit = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TeDhenatBiznesit", x => x.IDTeDhenatBiznesit);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TeDhenatBiznesit");

            migrationBuilder.DropColumn(
                name: "Shteti",
                table: "TeDhenatPerdoruesit");

            migrationBuilder.DropColumn(
                name: "qmimiProduktit",
                table: "TeDhenatEPorosis");

            migrationBuilder.DropColumn(
                name: "totaliProdukteve",
                table: "Porosit");

            migrationBuilder.DropColumn(
                name: "zbritja",
                table: "Porosit");

            migrationBuilder.AddColumn<string>(
                name: "kodiZbritjes",
                table: "TeDhenatEPorosis",
                type: "varchar(12)",
                unicode: false,
                maxLength: 12,
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "AspNetUserID",
                table: "Perdoruesi",
                type: "nvarchar(450)",
                maxLength: 450,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldMaxLength: 450,
                oldNullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "73e79d6d-e66c-4815-9e21-a47c91b0e243", "2", "Admin", "Admin" },
                    { "770c0648-d274-459c-9bfc-211ad071fc01", "1", "User", "User" },
                    { "b45b7653-2652-4dd2-a128-ffe9fa4f55e8", "3", "Menaxher", "Menaxher" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_TeDhenatEPorosis_kodiZbritjes",
                table: "TeDhenatEPorosis",
                column: "kodiZbritjes");

            migrationBuilder.AddForeignKey(
                name: "FK_TeDhenatPorosis_KodiZbritjes",
                table: "TeDhenatEPorosis",
                column: "kodiZbritjes",
                principalTable: "KodiZbritjes",
                principalColumn: "kodi");
        }
    }
}
