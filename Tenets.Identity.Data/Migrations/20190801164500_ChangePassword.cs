using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Tenets.Identity.Data.Migrations
{
    public partial class ChangePassword : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c11c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c13c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c14c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "UsersRoles",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a6ee"));

            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"));

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
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c11c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c13c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c14c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "UsersRoles",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a6ee"));

            migrationBuilder.DeleteData(
                table: "Menu",
                keyColumn: "Id",
                keyValue: new Guid("c12c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Roles",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "Id",
                keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"));

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
        }
    }
}
