using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class vendosjaRoleve : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "73e79d6d-e66c-4815-9e21-a47c91b0e243", "2", "Admin", "Admin" },
                    { "770c0648-d274-459c-9bfc-211ad071fc01", "1", "User", "User" },
                    { "b45b7653-2652-4dd2-a128-ffe9fa4f55e8", "3", "Menaxher", "Menaxher" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }
    }
}
