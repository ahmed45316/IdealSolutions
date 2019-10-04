using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class ModifyPolicy : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "DriverId",
                table: "Policies",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "DriverName",
                table: "Policies",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "DriverNationality",
                table: "Policies",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "DriverPhone",
                table: "Policies",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DriverId",
                table: "Policies");

            migrationBuilder.DropColumn(
                name: "DriverName",
                table: "Policies");

            migrationBuilder.DropColumn(
                name: "DriverNationality",
                table: "Policies");

            migrationBuilder.DropColumn(
                name: "DriverPhone",
                table: "Policies");
        }
    }
}
