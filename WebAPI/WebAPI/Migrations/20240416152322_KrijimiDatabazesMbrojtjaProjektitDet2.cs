using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class KrijimiDatabazesMbrojtjaProjektitDet2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Planet212257449",
                columns: table => new
                {
                    PlanetId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Type = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    isDeleted = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Planet212257449", x => x.PlanetId);
                });

            migrationBuilder.CreateTable(
                name: "Satellite212257449",
                columns: table => new
                {
                    SatelliteId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    isDeleted = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PlanetId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Satellite212257449", x => x.SatelliteId);
                    table.ForeignKey(
                        name: "FK_Satellite212257449_Planet212257449_PlanetId",
                        column: x => x.PlanetId,
                        principalTable: "Planet212257449",
                        principalColumn: "PlanetId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Satellite212257449_PlanetId",
                table: "Satellite212257449",
                column: "PlanetId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Satellite212257449");

            migrationBuilder.DropTable(
                name: "Planet212257449");
        }
    }
}
