using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class PerditesimiKodiZbritjes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "KodiZbritje");

            migrationBuilder.CreateTable(
                name: "KodiZbritjes",
                columns: table => new
                {
                    Kodi = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    DataKrijimit = table.Column<DateTime>(type: "datetime2", nullable: true),
                    QmimiZbritjes = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    IdProdukti = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_KodiZbritjes", x => x.Kodi);
                    table.ForeignKey(
                        name: "FK_KodiZbritjes_Produkti_IdProdukti",
                        column: x => x.IdProdukti,
                        principalTable: "Produkti",
                        principalColumn: "ProduktiId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_KodiZbritjes_IdProdukti",
                table: "KodiZbritjes",
                column: "IdProdukti");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "KodiZbritjes");

            migrationBuilder.CreateTable(
                name: "KodiZbritje",
                columns: table => new
                {
                    Kodi = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    IdProdukti = table.Column<int>(type: "int", nullable: true),
                    DataKrijimit = table.Column<DateTime>(type: "datetime2", nullable: true),
                    QmimiZbritjes = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_KodiZbritje", x => x.Kodi);
                    table.ForeignKey(
                        name: "FK_KodiZbritje_Produkti_IdProdukti",
                        column: x => x.IdProdukti,
                        principalTable: "Produkti",
                        principalColumn: "ProduktiId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_KodiZbritje_IdProdukti",
                table: "KodiZbritje",
                column: "IdProdukti");
        }
    }
}
