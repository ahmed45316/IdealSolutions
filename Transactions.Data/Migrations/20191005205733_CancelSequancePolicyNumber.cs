using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class CancelSequancePolicyNumber : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
           

            migrationBuilder.AlterColumn<long>(
                name: "PolicyNumber",
                table: "Policies",
                nullable: false,
                oldClrType: typeof(long),
                oldDefaultValueSql: "NEXT VALUE FOR PolicyNumbers");

            migrationBuilder.DropSequence(
               name: "PolicyNumbers");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
           

            migrationBuilder.AlterColumn<long>(
                name: "PolicyNumber",
                table: "Policies",
                nullable: false,
                defaultValueSql: "NEXT VALUE FOR PolicyNumbers",
                oldClrType: typeof(long));
            migrationBuilder.CreateSequence(
               name: "PolicyNumbers",
               startValue: 1000L);
        }
    }
}
