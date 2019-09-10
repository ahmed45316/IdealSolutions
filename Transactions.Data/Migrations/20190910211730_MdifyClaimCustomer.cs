using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class MdifyClaimCustomer : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ClaimCustomerPolicies");

            migrationBuilder.AddColumn<Guid>(
                name: "PolicyDetailId",
                table: "ClaimCustomers",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.CreateIndex(
                name: "IX_ClaimCustomers_PolicyDetailId",
                table: "ClaimCustomers",
                column: "PolicyDetailId");

            migrationBuilder.AddForeignKey(
                name: "FK_ClaimCustomers_PolicyDetails_PolicyDetailId",
                table: "ClaimCustomers",
                column: "PolicyDetailId",
                principalTable: "PolicyDetails",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ClaimCustomers_PolicyDetails_PolicyDetailId",
                table: "ClaimCustomers");

            migrationBuilder.DropIndex(
                name: "IX_ClaimCustomers_PolicyDetailId",
                table: "ClaimCustomers");

            migrationBuilder.DropColumn(
                name: "PolicyDetailId",
                table: "ClaimCustomers");

            migrationBuilder.CreateTable(
                name: "ClaimCustomerPolicies",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    ClaimCustomerId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    PolicyDetailId = table.Column<Guid>(nullable: false),
                    Value = table.Column<decimal>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ClaimCustomerPolicies", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ClaimCustomerPolicies_ClaimCustomers_ClaimCustomerId",
                        column: x => x.ClaimCustomerId,
                        principalTable: "ClaimCustomers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ClaimCustomerPolicies_PolicyDetails_PolicyDetailId",
                        column: x => x.PolicyDetailId,
                        principalTable: "PolicyDetails",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ClaimCustomerPolicies_ClaimCustomerId",
                table: "ClaimCustomerPolicies",
                column: "ClaimCustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_ClaimCustomerPolicies_PolicyDetailId",
                table: "ClaimCustomerPolicies",
                column: "PolicyDetailId");
        }
    }
}
