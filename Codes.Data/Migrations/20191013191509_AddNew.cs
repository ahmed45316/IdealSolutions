using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class AddNew : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "IdentifacationNumber",
                table: "Drivers",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "NationalityId",
                table: "Drivers",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Nationalities",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Nationalities", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Drivers_NationalityId",
                table: "Drivers",
                column: "NationalityId");

            migrationBuilder.AddForeignKey(
                name: "FK_Drivers_Nationalities_NationalityId",
                table: "Drivers",
                column: "NationalityId",
                principalTable: "Nationalities",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Drivers_Nationalities_NationalityId",
                table: "Drivers");

            migrationBuilder.DropTable(
                name: "Nationalities");

            migrationBuilder.DropIndex(
                name: "IX_Drivers_NationalityId",
                table: "Drivers");

            migrationBuilder.DropColumn(
                name: "IdentifacationNumber",
                table: "Drivers");

            migrationBuilder.DropColumn(
                name: "NationalityId",
                table: "Drivers");
        }
    }
}
