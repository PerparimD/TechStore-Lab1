using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class VendosjaTeDhenaveMbrotjeProjketi : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Banka57449",
                columns: table => new
                {
                    Id57449 = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Emri57449 = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Banka57449", x => x.Id57449);
                });

            migrationBuilder.CreateTable(
                name: "Personi57449",
                columns: table => new
                {
                    Id57449 = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Emri57449 = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Mbiemri57449 = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Banka57449ID = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Personi57449", x => x.Id57449);
                    table.ForeignKey(
                        name: "FK_Personi57449_Banka57449_Banka57449ID",
                        column: x => x.Banka57449ID,
                        principalTable: "Banka57449",
                        principalColumn: "Id57449");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Personi57449_Banka57449ID",
                table: "Personi57449",
                column: "Banka57449ID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Personi57449");

            migrationBuilder.DropTable(
                name: "Banka57449");
        }
    }
}
