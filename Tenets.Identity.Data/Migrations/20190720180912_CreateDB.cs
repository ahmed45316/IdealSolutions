using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Tenets.Identity.Data.Migrations
{
    public partial class CreateDB : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Menu",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    ScreenNameAr = table.Column<string>(maxLength: 256, nullable: true),
                    ScreenNameEn = table.Column<string>(maxLength: 256, nullable: true),
                    Href = table.Column<string>(maxLength: 256, nullable: true),
                    Controller = table.Column<string>(maxLength: 100, nullable: true),
                    Action = table.Column<string>(maxLength: 100, nullable: true),
                    Parameters = table.Column<string>(maxLength: 50, nullable: true),
                    Icon = table.Column<string>(maxLength: 100, nullable: true),
                    IsStop = table.Column<bool>(nullable: false),
                    ItsOrder = table.Column<int>(nullable: false),
                    ParentId = table.Column<Guid>(maxLength: 256, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Menu", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Menu_Menu_ParentId",
                        column: x => x.ParentId,
                        principalTable: "Menu",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEndDateUtc = table.Column<DateTime>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: false),
                    ImgPath = table.Column<string>(maxLength: 128, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "MenuRoles",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    RoleId = table.Column<Guid>(maxLength: 256, nullable: false),
                    MenuId = table.Column<Guid>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MenuRoles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MenuRoles_Menu_MenuId",
                        column: x => x.MenuId,
                        principalTable: "Menu",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MenuRoles_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRefreshTokens",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    IssuedUtc = table.Column<DateTime>(nullable: false),
                    ExpiresUtc = table.Column<DateTime>(nullable: false),
                    Token = table.Column<string>(maxLength: 450, nullable: false),
                    UserId = table.Column<Guid>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRefreshTokens", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRefreshTokens_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserClaims",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    UserId = table.Column<Guid>(maxLength: 256, nullable: false),
                    ClaimType = table.Column<string>(maxLength: 256, nullable: true),
                    ClaimValue = table.Column<string>(maxLength: 256, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserClaims_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserLogins",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 256, nullable: true),
                    ProviderKey = table.Column<string>(maxLength: 256, nullable: true),
                    UserId = table.Column<Guid>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserLogins", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserLogins_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UsersRoles",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    RoleId = table.Column<Guid>(maxLength: 256, nullable: false),
                    UserId = table.Column<Guid>(maxLength: 256, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UsersRoles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UsersRoles_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UsersRoles_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Menu",
                columns: new[] { "Id", "Action", "Controller", "Href", "Icon", "IsDeleted", "IsStop", "ItsOrder", "Parameters", "ParentId", "ScreenNameAr", "ScreenNameEn" },
                values: new object[] { new Guid("c11c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "index", "Home", null, "icon-home", false, false, 1, null, null, "الشاشة الرئيسية", "Main Screen" });

            migrationBuilder.InsertData(
                table: "Menu",
                columns: new[] { "Id", "Action", "Controller", "Href", "Icon", "IsDeleted", "IsStop", "ItsOrder", "Parameters", "ParentId", "ScreenNameAr", "ScreenNameEn" },
                values: new object[] { new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"), null, null, null, "fas fa-address-card", false, false, 2, null, null, "الصلاحيات", "Authentication" });

            migrationBuilder.InsertData(
                table: "Roles",
                columns: new[] { "Id", "IsDeleted", "Name" },
                values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), false, "Administrator" });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "AccessFailedCount", "Email", "EmailConfirmed", "ImgPath", "IsDeleted", "LockoutEnabled", "LockoutEndDateUtc", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"), 0, "admin@A3n.com", false, null, false, false, null, "ALQ9yNzGkKdXRP8gdol1whMNSIZAlmjXpF6SNHELSKf0N6+aZs24+5h8B4OzpBWrIw==", "+9", false, "045a1c70-35b0-4d51-b5e7-5a88beb747a7", false, "admin" });

            migrationBuilder.InsertData(
                table: "Menu",
                columns: new[] { "Id", "Action", "Controller", "Href", "Icon", "IsDeleted", "IsStop", "ItsOrder", "Parameters", "ParentId", "ScreenNameAr", "ScreenNameEn" },
                values: new object[] { new Guid("c13c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "ManageRoles", "Security", null, "icon-user", false, false, 7, null, new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "الدور الوظيفي", "Roles" });

            migrationBuilder.InsertData(
                table: "Menu",
                columns: new[] { "Id", "Action", "Controller", "Href", "Icon", "IsDeleted", "IsStop", "ItsOrder", "Parameters", "ParentId", "ScreenNameAr", "ScreenNameEn" },
                values: new object[] { new Guid("c14c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "Users", "Security", null, "icon-user", false, false, 8, null, new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "المستخدمين", "Users" });

            migrationBuilder.InsertData(
                table: "UsersRoles",
                columns: new[] { "Id", "IsDeleted", "RoleId", "UserId" },
                values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a6ee"), false, new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee") });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRefreshTokens_UserId",
                table: "AspNetRefreshTokens",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Menu_ParentId",
                table: "Menu",
                column: "ParentId");

            migrationBuilder.CreateIndex(
                name: "IX_MenuRoles_MenuId",
                table: "MenuRoles",
                column: "MenuId");

            migrationBuilder.CreateIndex(
                name: "IX_MenuRoles_RoleId",
                table: "MenuRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_UserClaims_UserId",
                table: "UserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UserLogins_UserId",
                table: "UserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UsersRoles_RoleId",
                table: "UsersRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_UsersRoles_UserId",
                table: "UsersRoles",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRefreshTokens");

            migrationBuilder.DropTable(
                name: "MenuRoles");

            migrationBuilder.DropTable(
                name: "UserClaims");

            migrationBuilder.DropTable(
                name: "UserLogins");

            migrationBuilder.DropTable(
                name: "UsersRoles");

            migrationBuilder.DropTable(
                name: "Menu");

            migrationBuilder.DropTable(
                name: "Roles");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
