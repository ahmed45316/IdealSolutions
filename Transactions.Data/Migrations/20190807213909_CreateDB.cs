using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Transactions.Data.Migrations
{
    public partial class CreateDB : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Policies",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    PolicyDateTime = table.Column<DateTime>(nullable: false),
                    PolicyDateTimeHijri = table.Column<DateTime>(nullable: true),
                    PayType = table.Column<byte>(nullable: false),
                    Notes = table.Column<string>(maxLength: 512, nullable: true),
                    TotalTrackCost = table.Column<decimal>(nullable: true),
                    TotalTrackValue = table.Column<decimal>(nullable: true),
                    TotalOverNightPrice = table.Column<decimal>(nullable: true),
                    TotalTownPrice = table.Column<decimal>(nullable: true),
                    TotalRecallPrice = table.Column<decimal>(nullable: true),
                    TotalDiscount = table.Column<decimal>(nullable: true),
                    AllTotalPriceBeforTax = table.Column<decimal>(nullable: true),
                    TotalTaxValue = table.Column<decimal>(nullable: true),
                    AllTotalPriceAfterTax = table.Column<decimal>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Policies", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PolicyDetails",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    PolicyId = table.Column<Guid>(nullable: false),
                    CustomerId = table.Column<Guid>(nullable: false),
                    CustomerCategoryId = table.Column<Guid>(nullable: false),
                    InvoicTypeId = table.Column<Guid>(nullable: false),
                    PolicyDetailDatetime = table.Column<DateTime>(nullable: true),
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
                    CarNo = table.Column<string>(maxLength: 16, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PolicyDetails", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PolicyDetails_Policies_PolicyId",
                        column: x => x.PolicyId,
                        principalTable: "Policies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PolicyDetails_PolicyId",
                table: "PolicyDetails",
                column: "PolicyId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PolicyDetails");

            migrationBuilder.DropTable(
                name: "Policies");
        }
    }
}
