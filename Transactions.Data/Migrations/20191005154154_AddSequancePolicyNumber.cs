using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class AddSequancePolicyNumber : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Policies_PolicyNumber",
                table: "Policies");

            migrationBuilder.CreateSequence(
                name: "PolicyNumbers",
                startValue: 1000L);

            migrationBuilder.AlterColumn<long>(
                name: "PolicyNumber",
                table: "Policies",
                nullable: false,
                defaultValueSql: "NEXT VALUE FOR PolicyNumbers",
                oldClrType: typeof(string),
                oldMaxLength: 64,
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Policies_PolicyNumber",
                table: "Policies",
                column: "PolicyNumber",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Policies_PolicyNumber",
                table: "Policies");

            migrationBuilder.DropSequence(
                name: "PolicyNumbers");

            migrationBuilder.AlterColumn<string>(
                name: "PolicyNumber",
                table: "Policies",
                maxLength: 64,
                nullable: true,
                oldClrType: typeof(long),
                oldDefaultValueSql: "NEXT VALUE FOR PolicyNumbers");

            migrationBuilder.CreateIndex(
                name: "IX_Policies_PolicyNumber",
                table: "Policies",
                column: "PolicyNumber",
                unique: true,
                filter: "[PolicyNumber] IS NOT NULL");
        }
    }
}
