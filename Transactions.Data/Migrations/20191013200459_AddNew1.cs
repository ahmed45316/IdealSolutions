using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class AddNew1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DriverNationalityId",
                table: "Policies",
                newName: "NationalityId");

            migrationBuilder.AddColumn<string>(
                name: "IdentifacationNumber",
                table: "Policies",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IdentifacationNumber",
                table: "Policies");

            migrationBuilder.RenameColumn(
                name: "NationalityId",
                table: "Policies",
                newName: "DriverNationalityId");
        }
    }
}
