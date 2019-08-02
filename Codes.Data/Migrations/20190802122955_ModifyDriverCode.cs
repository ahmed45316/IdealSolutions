using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class ModifyDriverCode : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "RepresentativeCode",
                table: "Drivers",
                newName: "DriverCode");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DriverCode",
                table: "Drivers",
                newName: "RepresentativeCode");
        }
    }
}
