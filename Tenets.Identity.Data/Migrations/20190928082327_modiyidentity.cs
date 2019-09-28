using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Tenets.Identity.Data.Migrations
{
    public partial class modiyidentity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"));

            migrationBuilder.DropColumn(
                name: "AccessFailedCount",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "EmailConfirmed",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "ImgPath",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "LockoutEnabled",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "LockoutEndDateUtc",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PasswordHash",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PhoneNumberConfirmed",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "TwoFactorEnabled",
                table: "Users");

            migrationBuilder.RenameColumn(
                name: "SecurityStamp",
                table: "Users",
                newName: "Password");

            migrationBuilder.AddColumn<Guid>(
                name: "RoleId",
                table: "Users",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.InsertData(
                table: "Roles",
                columns: new[] { "Id", "IsDeleted", "Name" },
                values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), false, "SuperAdmin" });

            migrationBuilder.InsertData(
                table: "Roles",
                columns: new[] { "Id", "IsDeleted", "Name" },
                values: new object[] { new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"), false, "Admin" });

            migrationBuilder.InsertData(
                table: "Roles",
                columns: new[] { "Id", "IsDeleted", "Name" },
                values: new object[] { new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"), false, "User" });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "Email", "IsDeleted", "Password", "PhoneNumber", "RoleId", "UserName" },
                values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"), "admin@A3n.com", false, "ADODTSgerU6FrBy/sNxk/imohjGADqV/AMjYYLw/jssO2gQIY6sC9prIFhby6sgdPQ==", "+9", new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "admin" });

            migrationBuilder.CreateIndex(
                name: "IX_Users_RoleId",
                table: "Users",
                column: "RoleId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_Roles_RoleId",
                table: "Users",
                column: "RoleId",
                principalTable: "Roles",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_Roles_RoleId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_RoleId",
                table: "Users");

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"));

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"));

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"));

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DropColumn(
                name: "RoleId",
                table: "Users");

            migrationBuilder.RenameColumn(
                name: "Password",
                table: "Users",
                newName: "SecurityStamp");

            migrationBuilder.AddColumn<int>(
                name: "AccessFailedCount",
                table: "Users",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<bool>(
                name: "EmailConfirmed",
                table: "Users",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "ImgPath",
                table: "Users",
                maxLength: 128,
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "LockoutEnabled",
                table: "Users",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "LockoutEndDateUtc",
                table: "Users",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PasswordHash",
                table: "Users",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "PhoneNumberConfirmed",
                table: "Users",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "TwoFactorEnabled",
                table: "Users",
                nullable: false,
                defaultValue: false);

            migrationBuilder.CreateTable(
                name: "AspNetRefreshTokens",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    ExpiresUtc = table.Column<DateTime>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    IssuedUtc = table.Column<DateTime>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
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
                name: "Menu",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    Action = table.Column<string>(maxLength: 100, nullable: true),
                    Controller = table.Column<string>(maxLength: 100, nullable: true),
                    Href = table.Column<string>(maxLength: 256, nullable: true),
                    Icon = table.Column<string>(maxLength: 100, nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    IsStop = table.Column<bool>(nullable: false),
                    ItsOrder = table.Column<int>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    Parameters = table.Column<string>(maxLength: 50, nullable: true),
                    ParentId = table.Column<Guid>(maxLength: 256, nullable: true),
                    ScreenNameAr = table.Column<string>(maxLength: 256, nullable: true),
                    ScreenNameEn = table.Column<string>(maxLength: 256, nullable: true)
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
                name: "UserClaims",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    ClaimType = table.Column<string>(maxLength: 256, nullable: true),
                    ClaimValue = table.Column<string>(maxLength: 256, nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    UserId = table.Column<Guid>(maxLength: 256, nullable: false)
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
                    IsDeleted = table.Column<bool>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
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
                    IsDeleted = table.Column<bool>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
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

            migrationBuilder.CreateTable(
                name: "MenuRoles",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    MenuId = table.Column<Guid>(maxLength: 256, nullable: false),
                    RoleId = table.Column<Guid>(maxLength: 256, nullable: false)
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
                values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"), 0, "admin@A3n.com", false, null, false, false, null, "ABYHOpE2Do3jXzpcPPzpHWmkdVBorF8/zmfIoCVqxd4N6RICbrfTrmClh/Tf3MDvtw==", "+9", false, "98ef26b6-19c6-4d76-9fd6-dacff86bcb89", false, "admin" });

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
    }
}
