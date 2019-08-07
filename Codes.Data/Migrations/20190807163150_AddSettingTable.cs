using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class AddSettingTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Setting",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    DatabaseAccount = table.Column<string>(maxLength: 128, nullable: true),
                    RevenueAccount = table.Column<string>(maxLength: 128, nullable: true),
                    FundAccount = table.Column<string>(maxLength: 128, nullable: true),
                    BankAccount = table.Column<string>(maxLength: 128, nullable: true),
                    JournalEntry = table.Column<string>(maxLength: 128, nullable: true),
                    TransportCost = table.Column<string>(maxLength: 128, nullable: true),
                    TaxTypeId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Setting", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Setting_TaxTypes_TaxTypeId",
                        column: x => x.TaxTypeId,
                        principalTable: "TaxTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Setting_TaxTypeId",
                table: "Setting",
                column: "TaxTypeId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Setting");
        }
    }
}
