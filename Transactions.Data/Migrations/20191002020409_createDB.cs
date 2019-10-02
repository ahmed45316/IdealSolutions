using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class createDB : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "OpeningBalances",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    Type = table.Column<int>(nullable: false),
                    TypeId = table.Column<Guid>(nullable: false),
                    DebitCridet = table.Column<int>(nullable: false),
                    Value = table.Column<decimal>(nullable: false),
                    Notes = table.Column<string>(maxLength: 512, nullable: true),
                    OpeningBlanceDate = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OpeningBalances", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Policies",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    CustomerId = table.Column<Guid>(nullable: false),
                    CustomerCategoryId = table.Column<Guid>(nullable: false),
                    InvoicTypeId = table.Column<Guid>(nullable: false),
                    PolicyDatetime = table.Column<DateTime>(nullable: true),
                    PolicyNumber = table.Column<string>(maxLength: 64, nullable: true),
                    RepresentativeId = table.Column<Guid>(nullable: false),
                    CarId = table.Column<Guid>(nullable: false),
                    CarTypeId = table.Column<Guid>(nullable: false),
                    TrackSettingId = table.Column<Guid>(nullable: false),
                    TrackCost = table.Column<decimal>(nullable: true),
                    TrackValue = table.Column<decimal>(nullable: true),
                    OverNightPrice = table.Column<decimal>(nullable: true),
                    TownPrice = table.Column<decimal>(nullable: true),
                    RecallPrice = table.Column<decimal>(nullable: true),
                    Discount = table.Column<decimal>(nullable: true),
                    TotalPriceBeforTax = table.Column<decimal>(nullable: true),
                    TaxTypeId = table.Column<Guid>(nullable: false),
                    TaxValue = table.Column<decimal>(nullable: true),
                    TotalPriceAfterTax = table.Column<decimal>(nullable: true),
                    Notes = table.Column<string>(maxLength: 512, nullable: true),
                    IsRentedCar = table.Column<bool>(nullable: false),
                    CarNo = table.Column<string>(maxLength: 16, nullable: true),
                    THeadId = table.Column<long>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Policies", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ClaimCustomers",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    CustomerId = table.Column<Guid>(nullable: false),
                    ClaimCustomerDate = table.Column<DateTime>(nullable: false),
                    Notes = table.Column<string>(maxLength: 512, nullable: true),
                    Total = table.Column<decimal>(nullable: false),
                    Tax = table.Column<decimal>(nullable: false),
                    TotalAfterTax = table.Column<decimal>(nullable: false),
                    PolicyId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ClaimCustomers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ClaimCustomers_Policies_PolicyId",
                        column: x => x.PolicyId,
                        principalTable: "Policies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

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
                    CollectReceiptNumber = table.Column<string>(nullable: true),
                    Paid = table.Column<decimal>(nullable: false),
                    PaymentType = table.Column<int>(nullable: false),
                    AccountCode = table.Column<string>(maxLength: 128, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true),
                    CollectReceiptType = table.Column<int>(nullable: false),
                    PolicyId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CollectReceipts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CollectReceipts_Policies_PolicyId",
                        column: x => x.PolicyId,
                        principalTable: "Policies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ClaimCustomers_PolicyId",
                table: "ClaimCustomers",
                column: "PolicyId");

            migrationBuilder.CreateIndex(
                name: "IX_CollectReceipts_CollectReceiptNumber",
                table: "CollectReceipts",
                column: "CollectReceiptNumber",
                unique: true,
                filter: "[CollectReceiptNumber] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_CollectReceipts_PolicyId",
                table: "CollectReceipts",
                column: "PolicyId");

            migrationBuilder.CreateIndex(
                name: "IX_Policies_PolicyNumber",
                table: "Policies",
                column: "PolicyNumber",
                unique: true,
                filter: "[PolicyNumber] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ClaimCustomers");

            migrationBuilder.DropTable(
                name: "CollectReceipts");

            migrationBuilder.DropTable(
                name: "OpeningBalances");

            migrationBuilder.DropTable(
                name: "Policies");
        }
    }
}
