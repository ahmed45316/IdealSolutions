using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class modiycolloctReceit : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_CollectReceipts_CollectReceiptNumber",
                table: "CollectReceipts");

            migrationBuilder.AlterColumn<string>(
                name: "CollectReceiptNumber",
                table: "CollectReceipts",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.CreateIndex(
                name: "IX_CollectReceipts_CollectReceiptNumber",
                table: "CollectReceipts",
                column: "CollectReceiptNumber",
                unique: true,
                filter: "[CollectReceiptNumber] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_CollectReceipts_CollectReceiptNumber",
                table: "CollectReceipts");

            migrationBuilder.AlterColumn<int>(
                name: "CollectReceiptNumber",
                table: "CollectReceipts",
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_CollectReceipts_CollectReceiptNumber",
                table: "CollectReceipts",
                column: "CollectReceiptNumber",
                unique: true);
        }
    }
}
