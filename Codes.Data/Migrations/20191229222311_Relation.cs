using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class Relation : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Branches_Companies_CompanyId",
                table: "Branches");

            migrationBuilder.DropForeignKey(
                name: "FK_Cities_Countries_CountryId",
                table: "Cities");

            migrationBuilder.DropForeignKey(
                name: "FK_Setting_TaxTypes_TaxTypeId",
                table: "Setting");

            migrationBuilder.DropForeignKey(
                name: "FK_TaxTypes_TaxCategories_TaxCategoryId",
                table: "TaxTypes");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Branches_Companies_CompanyId",
                table: "Branches",
                column: "CompanyId",
                principalTable: "Companies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Cities_Countries_CountryId",
                table: "Cities",
                column: "CountryId",
                principalTable: "Countries",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Setting_TaxTypes_TaxTypeId",
                table: "Setting",
                column: "TaxTypeId",
                principalTable: "TaxTypes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TaxTypes_TaxCategories_TaxCategoryId",
                table: "TaxTypes",
                column: "TaxCategoryId",
                principalTable: "TaxCategories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

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
                name: "FK_Branches_Companies_CompanyId",
                table: "Branches");

            migrationBuilder.DropForeignKey(
                name: "FK_Cities_Countries_CountryId",
                table: "Cities");

            migrationBuilder.DropForeignKey(
                name: "FK_Setting_TaxTypes_TaxTypeId",
                table: "Setting");

            migrationBuilder.DropForeignKey(
                name: "FK_TaxTypes_TaxCategories_TaxCategoryId",
                table: "TaxTypes");

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

            migrationBuilder.AddForeignKey(
                name: "FK_Branches_Companies_CompanyId",
                table: "Branches",
                column: "CompanyId",
                principalTable: "Companies",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Cities_Countries_CountryId",
                table: "Cities",
                column: "CountryId",
                principalTable: "Countries",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Setting_TaxTypes_TaxTypeId",
                table: "Setting",
                column: "TaxTypeId",
                principalTable: "TaxTypes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TaxTypes_TaxCategories_TaxCategoryId",
                table: "TaxTypes",
                column: "TaxCategoryId",
                principalTable: "TaxCategories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetailCarTypes_CarTypes_CarTypeId",
                table: "TrackPriceDetailCarTypes",
                column: "CarTypeId",
                principalTable: "CarTypes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetailCarTypes_TrackPriceDetails_TrackPriceDetailId",
                table: "TrackPriceDetailCarTypes",
                column: "TrackPriceDetailId",
                principalTable: "TrackPriceDetails",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetails_TrackPrices_TrackPriceId",
                table: "TrackPriceDetails",
                column: "TrackPriceId",
                principalTable: "TrackPrices",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_TrackPriceDetails_TrackSetting_TrackSettingId",
                table: "TrackPriceDetails",
                column: "TrackSettingId",
                principalTable: "TrackSetting",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
