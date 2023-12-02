using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI.Migrations
{
    /// <inheritdoc />
    public partial class VendosjaETeDhenave : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            // Add your existing code here...

            // Insert provided data into AspNetRoles table
            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "Name", "NormalizedName", "ConcurrencyStamp" },
                values: new object[,]
                {
            { "0267d4fd-5bac-4552-9930-8e528b2fec1b", "Admin", "ADMIN", "bcb0a7f8-41b2-48ce-bf39-fbc24516012e" },
            { "db3dd60d-a159-4f85-a9a5-d1444ee1013d", "Menaxher", "MENAXHER", "3e215a86-6eeb-48a6-90d9-fe12a7a70f28" },
            { "be4b8ef8-abf0-454c-852c-676cdab20e3b", "User", "USER", "264000ea-9d66-4686-b48b-e06165a906fc" }
                });

            // Insert provided data into AspNetUsers table
            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[]
                {
                    "Id", "UserName", "NormalizedUserName", "Email", "NormalizedEmail",
                    "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp",
                    "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnabled", "AccessFailedCount"
                },
                values: new object[,]
                {
                    {
                        "9d6b2651-641d-4c85-9154-99761863fc65", "user", "USER", "user@techstore.com", "USER@TECHSTORE.COM",
                        false, // EmailConfirmed
                        "AQAAAAEAACcQAAAAEFvlpjPerR25vlxvKiV9GnWzzfQGEk9LCpEfnHG/yUyyaYXsRp/sN52ZWgKNbsq1JA==",
                        "3VINW7OQ6CJ7CZE3737G4L6WGMKBHWPT", "241f5600-e4e1-4e08-b789-9b0fc9367502", "", // PhoneNumber
                        false, // PhoneNumberConfirmed
                        false, // TwoFactorEnabled
                        false, // LockoutEnabled
                        0 // AccessFailedCount
                    },
                    // Add other users here
                    {
                        "d2a7088f-a25e-4f3f-8488-b616eeaff928", "menagjer", "MENAGJER", "menagjer@techstore.com", "MENAGJER@TECHSTORE.COM",
                        false, // EmailConfirmed
                        "AQAAAAEAACcQAAAAEP60Y+OpxVc3CPWS9NZu79pNu/KAAsxbrm8qTWpL9+ILK+Sd/3Pw4yLEas1N2TXL+g==",
                        "2TO7IOMEDSKTLMHBALX52ICRC3HX3FNQ", "297b4ee1-133a-4ad2-8242-201592f7a43d", "", // PhoneNumber
                        false, // PhoneNumberConfirmed
                        false, // TwoFactorEnabled
                        false, // LockoutEnabled
                        0 // AccessFailedCount
                    },
                    {
                        "f2bb7622-23ac-4c5f-8d71-00032b281e37", "admin", "ADMIN", "admin@techstore.com", "ADMIN@TECHSTORE.COM",
                        false, // EmailConfirmed
                        "AQAAAAEAACcQAAAAEAy6t6f1jILbKXRyqzSZGrR4zq/Wl8G525tgzrBsqYIG4ksRH5HySRRlJrMtzvfTug==",
                        "RHCE5BDZYCGBDPAZQ74P3IWVFBNDWMEX", "5dd7b4ea-994f-43c2-bdfd-1bef310ebf29", "", // PhoneNumber
                        false, // PhoneNumberConfirmed
                        false, // TwoFactorEnabled
                        false, // LockoutEnabled
                        0 // AccessFailedCount
                    }
                });

            migrationBuilder.InsertData(
    table: "AspNetUserRoles",
    columns: new[] { "UserId", "RoleId" },
    values: new object[,]
    {
{ "9d6b2651-641d-4c85-9154-99761863fc65", "be4b8ef8-abf0-454c-852c-676cdab20e3b"},
{ "d2a7088f-a25e-4f3f-8488-b616eeaff928", "be4b8ef8-abf0-454c-852c-676cdab20e3b"},
{ "f2bb7622-23ac-4c5f-8d71-00032b281e37", "be4b8ef8-abf0-454c-852c-676cdab20e3b"},
{ "d2a7088f-a25e-4f3f-8488-b616eeaff928", "db3dd60d-a159-4f85-a9a5-d1444ee1013d"},
{ "f2bb7622-23ac-4c5f-8d71-00032b281e37", "db3dd60d-a159-4f85-a9a5-d1444ee1013d"},
{ "f2bb7622-23ac-4c5f-8d71-00032b281e37", "0267d4fd-5bac-4552-9930-8e528b2fec1b"}
    });

            // Add other provided data...

            migrationBuilder.InsertData(
                table: "Perdoruesi",
                columns: new[] { "UserId", "Emri", "Mbiemri", "Email", "Username", "AspNetUserId" },
                values: new object[,]
                {
            { 1, "Administrator", "Administrator", "admin@techstore.com", "admin", "f2bb7622-23ac-4c5f-8d71-00032b281e37" },
            { 2, "Menagjer", "Menagjer", "menagjer@techstore.com", "menagjer", "d2a7088f-a25e-4f3f-8488-b616eeaff928" },
            { 3, "User", "User", "user@techstore.com", "user", "9d6b2651-641d-4c85-9154-99761863fc65" }
                });

            migrationBuilder.InsertData(
                table: "TeDhenatPerdoruesit",
                columns: new[] { "TeDhenatId", "UserId", "ZipKodi" },
                values: new object[,]
                {
            { 1, 1, 0 },
            { 2, 2, 0 },
            { 3, 3, 0 }
                });

            migrationBuilder.InsertData(
                table: "TeDhenatBiznesit",
                columns: new[] { "IdteDhenatBiznesit", "Nui", "Nf", "Nrtvsh", "Logo" },
                values: new object[,]
                {
            { 1, 0, 0, 0, "PaLogo.png" }
                });
        }

        // Rest of your migration code...


        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            // Down migration logic if needed
        }
    }
}
