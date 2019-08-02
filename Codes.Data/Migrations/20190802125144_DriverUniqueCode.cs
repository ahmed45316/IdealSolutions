using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class DriverUniqueCode : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<bool>(
                name: "IsWorking",
                table: "Drivers",
                nullable: false,
                defaultValueSql: "0",
                oldClrType: typeof(bool));

            migrationBuilder.CreateIndex(
                name: "IX_Drivers_DriverCode",
                table: "Drivers",
                column: "DriverCode",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Drivers_DriverCode",
                table: "Drivers");

            migrationBuilder.AlterColumn<bool>(
                name: "IsWorking",
                table: "Drivers",
                nullable: false,
                oldClrType: typeof(bool),
                oldDefaultValueSql: "0");
        }
    }
}
