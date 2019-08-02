using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class AddDrivers : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetail_TrackPrices_TrackPriceId",
                table: "TrackPriceDetail");

            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetail_TrackSetting_TrackSettingId",
                table: "TrackPriceDetail");

            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetailCarType_CarTypes_CarTypeId",
                table: "TrackPriceDetailCarType");

            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetailCarType_TrackPriceDetail_TrackPriceDetailId",
                table: "TrackPriceDetailCarType");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TrackPriceDetailCarType",
                table: "TrackPriceDetailCarType");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TrackPriceDetail",
                table: "TrackPriceDetail");

            migrationBuilder.RenameTable(
                name: "TrackPriceDetailCarType",
                newName: "TrackPriceDetailCarTypes");

            migrationBuilder.RenameTable(
                name: "TrackPriceDetail",
                newName: "TrackPriceDetails");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetailCarType_TrackPriceDetailId",
                table: "TrackPriceDetailCarTypes",
                newName: "IX_TrackPriceDetailCarTypes_TrackPriceDetailId");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetailCarType_CarTypeId",
                table: "TrackPriceDetailCarTypes",
                newName: "IX_TrackPriceDetailCarTypes_CarTypeId");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetail_TrackSettingId",
                table: "TrackPriceDetails",
                newName: "IX_TrackPriceDetails_TrackSettingId");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetail_TrackPriceId",
                table: "TrackPriceDetails",
                newName: "IX_TrackPriceDetails_TrackPriceId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TrackPriceDetailCarTypes",
                table: "TrackPriceDetailCarTypes",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TrackPriceDetails",
                table: "TrackPriceDetails",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "Drivers",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    RepresentativeCode = table.Column<int>(nullable: false),
                    Phone = table.Column<string>(maxLength: 20, nullable: true),
                    Mobile = table.Column<string>(maxLength: 20, nullable: true),
                    Fax = table.Column<string>(maxLength: 30, nullable: true),
                    Address = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 64, nullable: true),
                    IsWorking = table.Column<bool>(nullable: false),
                    AccountCode = table.Column<string>(maxLength: 128, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Drivers", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetailCarTypes_CarTypes_CarTypeId",
                table: "TrackPriceDetailCarTypes",
                column: "CarTypeId",
                principalTable: "CarTypes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetailCarTypes_TrackPriceDetails_TrackPriceDetailId",
                table: "TrackPriceDetailCarTypes",
                column: "TrackPriceDetailId",
                principalTable: "TrackPriceDetails",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetails_TrackPrices_TrackPriceId",
                table: "TrackPriceDetails",
                column: "TrackPriceId",
                principalTable: "TrackPrices",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetails_TrackSetting_TrackSettingId",
                table: "TrackPriceDetails",
                column: "TrackSettingId",
                principalTable: "TrackSetting",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetailCarTypes_CarTypes_CarTypeId",
                table: "TrackPriceDetailCarTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetailCarTypes_TrackPriceDetails_TrackPriceDetailId",
                table: "TrackPriceDetailCarTypes");

            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetails_TrackPrices_TrackPriceId",
                table: "TrackPriceDetails");

            migrationBuilder.DropForeignKey(
                name: "FK_TrackPriceDetails_TrackSetting_TrackSettingId",
                table: "TrackPriceDetails");

            migrationBuilder.DropTable(
                name: "Drivers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TrackPriceDetails",
                table: "TrackPriceDetails");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TrackPriceDetailCarTypes",
                table: "TrackPriceDetailCarTypes");

            migrationBuilder.RenameTable(
                name: "TrackPriceDetails",
                newName: "TrackPriceDetail");

            migrationBuilder.RenameTable(
                name: "TrackPriceDetailCarTypes",
                newName: "TrackPriceDetailCarType");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetails_TrackSettingId",
                table: "TrackPriceDetail",
                newName: "IX_TrackPriceDetail_TrackSettingId");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetails_TrackPriceId",
                table: "TrackPriceDetail",
                newName: "IX_TrackPriceDetail_TrackPriceId");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetailCarTypes_TrackPriceDetailId",
                table: "TrackPriceDetailCarType",
                newName: "IX_TrackPriceDetailCarType_TrackPriceDetailId");

            migrationBuilder.RenameIndex(
                name: "IX_TrackPriceDetailCarTypes_CarTypeId",
                table: "TrackPriceDetailCarType",
                newName: "IX_TrackPriceDetailCarType_CarTypeId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TrackPriceDetail",
                table: "TrackPriceDetail",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TrackPriceDetailCarType",
                table: "TrackPriceDetailCarType",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetail_TrackPrices_TrackPriceId",
                table: "TrackPriceDetail",
                column: "TrackPriceId",
                principalTable: "TrackPrices",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetail_TrackSetting_TrackSettingId",
                table: "TrackPriceDetail",
                column: "TrackSettingId",
                principalTable: "TrackSetting",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetailCarType_CarTypes_CarTypeId",
                table: "TrackPriceDetailCarType",
                column: "CarTypeId",
                principalTable: "CarTypes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetailCarType_TrackPriceDetail_TrackPriceDetailId",
                table: "TrackPriceDetailCarType",
                column: "TrackPriceDetailId",
                principalTable: "TrackPriceDetail",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
