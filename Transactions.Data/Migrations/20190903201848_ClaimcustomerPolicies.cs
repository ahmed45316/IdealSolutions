using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class ClaimcustomerPolicies : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ClaimCustomerPolicies",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    PolicyDetailId = table.Column<Guid>(nullable: false),
                    Value = table.Column<decimal>(nullable: false),
                    ClaimCustomerId = table.Column<Guid>(nullable: false)
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

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ClaimCustomerPolicies");
        }
    }
}
