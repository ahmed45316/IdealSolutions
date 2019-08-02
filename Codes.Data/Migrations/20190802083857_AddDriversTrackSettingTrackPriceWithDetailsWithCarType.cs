using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class AddDriversTrackSettingTrackPriceWithDetailsWithCarType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TrackPrices_Tracks_FromTrackId",
                table: "TrackPrices");

            migrationBuilder.DropForeignKey(
                name: "FK_TrackPrices_Tracks_ToTrackId",
                table: "TrackPrices");

            migrationBuilder.DropIndex(
                name: "IX_TrackPrices_FromTrackId",
                table: "TrackPrices");

            migrationBuilder.DropIndex(
                name: "IX_TrackPrices_ToTrackId",
                table: "TrackPrices");

            migrationBuilder.DropColumn(
                name: "FromTrackId",
                table: "TrackPrices");

            migrationBuilder.DropColumn(
                name: "ToTrackId",
                table: "TrackPrices");

            migrationBuilder.AddColumn<DateTime>(
                name: "FromDate",
                table: "TrackPrices",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "OverNightPrice",
                table: "TrackPrices",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "RecallPrice",
                table: "TrackPrices",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "ToDate",
                table: "TrackPrices",
                nullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "TownPrice",
                table: "TrackPrices",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "TrackSetting",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    FromTrackId = table.Column<Guid>(nullable: true),
                    ToTrackId = table.Column<Guid>(nullable: true),
                    DistanceByKilloMeters = table.Column<double>(nullable: false),
                    TrackSettingType = table.Column<byte>(nullable: false),
                    DriverMotivation = table.Column<decimal>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrackSetting", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TrackSetting_Tracks_FromTrackId",
                        column: x => x.FromTrackId,
                        principalTable: "Tracks",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TrackSetting_Tracks_ToTrackId",
                        column: x => x.ToTrackId,
                        principalTable: "Tracks",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TrackPriceDetail",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    TrackPriceId = table.Column<Guid>(nullable: false),
                    TrackSettingId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrackPriceDetail", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TrackPriceDetail_TrackPrices_TrackPriceId",
                        column: x => x.TrackPriceId,
                        principalTable: "TrackPrices",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TrackPriceDetail_TrackSetting_TrackSettingId",
                        column: x => x.TrackSettingId,
                        principalTable: "TrackSetting",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TrackPriceDetailCarType",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    TrackPriceDetailId = table.Column<Guid>(nullable: false),
                    CarTypeId = table.Column<Guid>(nullable: false),
                    CarTypePrice = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrackPriceDetailCarType", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TrackPriceDetailCarType_CarTypes_CarTypeId",
                        column: x => x.CarTypeId,
                        principalTable: "CarTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TrackPriceDetailCarType_TrackPriceDetail_TrackPriceDetailId",
                        column: x => x.TrackPriceDetailId,
                        principalTable: "TrackPriceDetail",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_TrackPriceDetail_TrackPriceId",
                table: "TrackPriceDetail",
                column: "TrackPriceId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackPriceDetail_TrackSettingId",
                table: "TrackPriceDetail",
                column: "TrackSettingId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackPriceDetailCarType_CarTypeId",
                table: "TrackPriceDetailCarType",
                column: "CarTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackPriceDetailCarType_TrackPriceDetailId",
                table: "TrackPriceDetailCarType",
                column: "TrackPriceDetailId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackSetting_FromTrackId",
                table: "TrackSetting",
                column: "FromTrackId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackSetting_ToTrackId",
                table: "TrackSetting",
                column: "ToTrackId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TrackPriceDetailCarType");

            migrationBuilder.DropTable(
                name: "TrackPriceDetail");

            migrationBuilder.DropTable(
                name: "TrackSetting");

            migrationBuilder.DropColumn(
                name: "FromDate",
                table: "TrackPrices");

            migrationBuilder.DropColumn(
                name: "OverNightPrice",
                table: "TrackPrices");

            migrationBuilder.DropColumn(
                name: "RecallPrice",
                table: "TrackPrices");

            migrationBuilder.DropColumn(
                name: "ToDate",
                table: "TrackPrices");

            migrationBuilder.DropColumn(
                name: "TownPrice",
                table: "TrackPrices");

            migrationBuilder.AddColumn<Guid>(
                name: "FromTrackId",
                table: "TrackPrices",
                nullable: true);

            migrationBuilder.AddColumn<Guid>(
                name: "ToTrackId",
                table: "TrackPrices",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_TrackPrices_FromTrackId",
                table: "TrackPrices",
                column: "FromTrackId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackPrices_ToTrackId",
                table: "TrackPrices",
                column: "ToTrackId");

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPrices_Tracks_FromTrackId",
                table: "TrackPrices",
                column: "FromTrackId",
                principalTable: "Tracks",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPrices_Tracks_ToTrackId",
                table: "TrackPrices",
                column: "ToTrackId",
                principalTable: "Tracks",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
