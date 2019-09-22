using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class AddConfigurationAndCollectReceipt : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CollectReceipts",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    CustomerId = table.Column<Guid>(nullable: false),
                    CollectReceiptDate = table.Column<DateTime>(nullable: false),
                    CollectReceiptDateHegry = table.Column<DateTime>(nullable: true),
                    Notes = table.Column<string>(maxLength: 512, nullable: true),
                    CollectReceiptNumber = table.Column<int>(nullable: false),
                    Paid = table.Column<decimal>(nullable: false),
                    PaymentType = table.Column<int>(nullable: false),
                    AccountCode = table.Column<string>(maxLength: 128, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true),
                    CollectReceiptType = table.Column<int>(nullable: false),
                    PolicyDetailId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CollectReceipts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CollectReceipts_PolicyDetails_PolicyDetailId",
                        column: x => x.PolicyDetailId,
                        principalTable: "PolicyDetails",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PolicyDetails_PolicyNumber",
                table: "PolicyDetails",
                column: "PolicyNumber",
                unique: true,
                filter: "[PolicyNumber] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_CollectReceipts_CollectReceiptNumber",
                table: "CollectReceipts",
                column: "CollectReceiptNumber",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_CollectReceipts_PolicyDetailId",
                table: "CollectReceipts",
                column: "PolicyDetailId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CollectReceipts");

            migrationBuilder.DropIndex(
                name: "IX_PolicyDetails_PolicyNumber",
                table: "PolicyDetails");
        }
    }
}
