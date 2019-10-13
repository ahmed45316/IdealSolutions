using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class AddNew : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DriverNationality",
                table: "Policies",
                newName: "ManafestNumber");

            migrationBuilder.AddColumn<Guid>(
                name: "BranchId",
                table: "Policies",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<string>(
                name: "ColdNumber",
                table: "Policies",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "DriverNationalityId",
                table: "Policies",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "RequestPaymentId",
                table: "Policies",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BranchId",
                table: "Policies");

            migrationBuilder.DropColumn(
                name: "ColdNumber",
                table: "Policies");

            migrationBuilder.DropColumn(
                name: "DriverNationalityId",
                table: "Policies");

            migrationBuilder.DropColumn(
                name: "RequestPaymentId",
                table: "Policies");

            migrationBuilder.RenameColumn(
                name: "ManafestNumber",
                table: "Policies",
                newName: "DriverNationality");
        }
    }
}
