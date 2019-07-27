using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Codes.Data.Migrations
{
    public partial class CreateDB : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Cars",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    PlateNumber = table.Column<string>(maxLength: 64, nullable: true),
                    Model = table.Column<string>(maxLength: 64, nullable: true),
                    Notes = table.Column<string>(maxLength: 512, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cars", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CarTypes",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CarTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Companies",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    TaxNumber = table.Column<string>(maxLength: 128, nullable: true),
                    Address = table.Column<string>(maxLength: 256, nullable: true),
                    Logo = table.Column<string>(maxLength: 128, nullable: true),
                    CompanyGeneralLadgerId = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Companies", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Countries",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    CountryKey = table.Column<string>(maxLength: 8, nullable: true),
                    NationalityAr = table.Column<string>(maxLength: 128, nullable: true),
                    NationalityEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Countries", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CustomerCategories",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomerCategories", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "InvoiceTypes",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InvoiceTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Rents",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    RentCode = table.Column<int>(nullable: false),
                    Phone = table.Column<string>(maxLength: 20, nullable: true),
                    Mobile = table.Column<string>(maxLength: 20, nullable: true),
                    Fax = table.Column<string>(maxLength: 30, nullable: true),
                    ResponsibleFor = table.Column<string>(maxLength: 128, nullable: true),
                    Address = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 64, nullable: true),
                    IsWorking = table.Column<bool>(nullable: false, defaultValueSql: "0"),
                    AccountCode = table.Column<string>(maxLength: 128, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Rents", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Representatives",
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
                    ResponsibleFor = table.Column<string>(maxLength: 128, nullable: true),
                    Address = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 64, nullable: true),
                    IsWorking = table.Column<bool>(nullable: false, defaultValueSql: "0"),
                    AccountCode = table.Column<string>(maxLength: 128, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Representatives", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TaxCategories",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TaxCategories", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Tracks",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tracks", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Branches",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    CompanyId = table.Column<Guid>(nullable: false),
                    BranchGeneralLadgerId = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Branches", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Branches_Companies_CompanyId",
                        column: x => x.CompanyId,
                        principalTable: "Companies",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Cities",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    CountryId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cities", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Cities_Countries_CountryId",
                        column: x => x.CountryId,
                        principalTable: "Countries",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Customers",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    CustomerCode = table.Column<int>(nullable: false),
                    Phone = table.Column<string>(maxLength: 20, nullable: true),
                    Mobile = table.Column<string>(maxLength: 20, nullable: true),
                    Fax = table.Column<string>(maxLength: 30, nullable: true),
                    ResponsibleFor = table.Column<string>(maxLength: 128, nullable: true),
                    Address = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 64, nullable: true),
                    IsWorking = table.Column<bool>(nullable: false, defaultValueSql: "0"),
                    IsOutSideCustomer = table.Column<bool>(nullable: false, defaultValueSql: "0"),
                    AccountCode = table.Column<string>(maxLength: 128, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true),
                    RepresentativeId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Customers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Customers_Representatives_RepresentativeId",
                        column: x => x.RepresentativeId,
                        principalTable: "Representatives",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TaxTypes",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    NameAr = table.Column<string>(maxLength: 128, nullable: true),
                    NameEn = table.Column<string>(maxLength: 128, nullable: true),
                    Percentage = table.Column<double>(nullable: false),
                    AccountCode = table.Column<string>(maxLength: 128, nullable: true),
                    CostCenter = table.Column<string>(maxLength: 128, nullable: true),
                    TaxCategoryId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TaxTypes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TaxTypes_TaxCategories_TaxCategoryId",
                        column: x => x.TaxCategoryId,
                        principalTable: "TaxCategories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TrackPrices",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreateUserId = table.Column<Guid>(nullable: false),
                    CreateDate = table.Column<DateTime>(nullable: false),
                    ModifyUserId = table.Column<Guid>(nullable: true),
                    ModifyDate = table.Column<DateTime>(nullable: true),
                    CustomerId = table.Column<Guid>(nullable: false),
                    FromTrackId = table.Column<Guid>(nullable: true),
                    ToTrackId = table.Column<Guid>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrackPrices", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TrackPrices_Customers_CustomerId",
                        column: x => x.CustomerId,
                        principalTable: "Customers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TrackPrices_Tracks_FromTrackId",
                        column: x => x.FromTrackId,
                        principalTable: "Tracks",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TrackPrices_Tracks_ToTrackId",
                        column: x => x.ToTrackId,
                        principalTable: "Tracks",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Branches_CompanyId",
                table: "Branches",
                column: "CompanyId");

            migrationBuilder.CreateIndex(
                name: "IX_Cities_CountryId",
                table: "Cities",
                column: "CountryId");

            migrationBuilder.CreateIndex(
                name: "IX_Customers_CustomerCode",
                table: "Customers",
                column: "CustomerCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Customers_RepresentativeId",
                table: "Customers",
                column: "RepresentativeId");

            migrationBuilder.CreateIndex(
                name: "IX_Rents_RentCode",
                table: "Rents",
                column: "RentCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Representatives_RepresentativeCode",
                table: "Representatives",
                column: "RepresentativeCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_TaxTypes_TaxCategoryId",
                table: "TaxTypes",
                column: "TaxCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackPrices_CustomerId",
                table: "TrackPrices",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackPrices_FromTrackId",
                table: "TrackPrices",
                column: "FromTrackId");

            migrationBuilder.CreateIndex(
                name: "IX_TrackPrices_ToTrackId",
                table: "TrackPrices",
                column: "ToTrackId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Branches");

            migrationBuilder.DropTable(
                name: "Cars");

            migrationBuilder.DropTable(
                name: "CarTypes");

            migrationBuilder.DropTable(
                name: "Cities");

            migrationBuilder.DropTable(
                name: "CustomerCategories");

            migrationBuilder.DropTable(
                name: "InvoiceTypes");

            migrationBuilder.DropTable(
                name: "Rents");

            migrationBuilder.DropTable(
                name: "TaxTypes");

            migrationBuilder.DropTable(
                name: "TrackPrices");

            migrationBuilder.DropTable(
                name: "Companies");

            migrationBuilder.DropTable(
                name: "Countries");

            migrationBuilder.DropTable(
                name: "TaxCategories");

            migrationBuilder.DropTable(
                name: "Customers");

            migrationBuilder.DropTable(
                name: "Tracks");

            migrationBuilder.DropTable(
                name: "Representatives");
        }
    }
}
