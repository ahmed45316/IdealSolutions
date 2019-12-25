using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class customer : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ClaimCustomers_Policies_PolicyId",
                table: "ClaimCustomers");

            migrationBuilder.DropForeignKey(
                name: "FK_CollectReceipts_Policies_PolicyId",
                table: "CollectReceipts");

            migrationBuilder.AddColumn<Guid>(
                name: "CustomerId",
                table: "OpeningBalances",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Customers",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customers", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Policies_CustomerId",
                table: "Policies",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_OpeningBalances_CustomerId",
                table: "OpeningBalances",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_CollectReceipts_CustomerId",
                table: "CollectReceipts",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_ClaimCustomers_CustomerId",
                table: "ClaimCustomers",
                column: "CustomerId");

            migrationBuilder.AddForeignKey(
                name: "FK_ClaimCustomers_Customers_CustomerId",
                table: "ClaimCustomers",
                column: "CustomerId",
                principalTable: "Customers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ClaimCustomers_Policies_PolicyId",
                table: "ClaimCustomers",
                column: "PolicyId",
                principalTable: "Policies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_CollectReceipts_Customers_CustomerId",
                table: "CollectReceipts",
                column: "CustomerId",
                principalTable: "Customers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_CollectReceipts_Policies_PolicyId",
                table: "CollectReceipts",
                column: "PolicyId",
                principalTable: "Policies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_OpeningBalances_Customers_CustomerId",
                table: "OpeningBalances",
                column: "CustomerId",
                principalTable: "Customers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Policies_Customers_CustomerId",
                table: "Policies",
                column: "CustomerId",
                principalTable: "Customers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ClaimCustomers_Customers_CustomerId",
                table: "ClaimCustomers");

            migrationBuilder.DropForeignKey(
                name: "FK_ClaimCustomers_Policies_PolicyId",
                table: "ClaimCustomers");

            migrationBuilder.DropForeignKey(
                name: "FK_CollectReceipts_Customers_CustomerId",
                table: "CollectReceipts");

            migrationBuilder.DropForeignKey(
                name: "FK_CollectReceipts_Policies_PolicyId",
                table: "CollectReceipts");

            migrationBuilder.DropForeignKey(
                name: "FK_OpeningBalances_Customers_CustomerId",
                table: "OpeningBalances");

            migrationBuilder.DropForeignKey(
                name: "FK_Policies_Customers_CustomerId",
                table: "Policies");

            migrationBuilder.DropTable(
                name: "Customers");

            migrationBuilder.DropIndex(
                name: "IX_Policies_CustomerId",
                table: "Policies");

            migrationBuilder.DropIndex(
                name: "IX_OpeningBalances_CustomerId",
                table: "OpeningBalances");

            migrationBuilder.DropIndex(
                name: "IX_CollectReceipts_CustomerId",
                table: "CollectReceipts");

            migrationBuilder.DropIndex(
                name: "IX_ClaimCustomers_CustomerId",
                table: "ClaimCustomers");

            migrationBuilder.DropColumn(
                name: "CustomerId",
                table: "OpeningBalances");

            migrationBuilder.AddForeignKey(
                name: "FK_ClaimCustomers_Policies_PolicyId",
                table: "ClaimCustomers",
                column: "PolicyId",
                principalTable: "Policies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CollectReceipts_Policies_PolicyId",
                table: "CollectReceipts",
                column: "PolicyId",
                principalTable: "Policies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
