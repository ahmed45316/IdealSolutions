using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Tenets.Identity.Data.Migrations
{
    public partial class AddNew : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

            migrationBuilder.AddColumn<Guid>(
                name: "BranchId",
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
                columns: new[] { "Id", "BranchId", "Email", "IsDeleted", "Password", "PhoneNumber", "RoleId", "UserName" },
                values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"), new Guid("00000000-0000-0000-0000-000000000000"), "admin@A3n.com", false, "AEI8Ml0NjJs46HCP9CY1mdsIdA1iP801Fa6W+qQ92MwFGglE70UxZKxkv7QrWyboMA==", "+9", new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "admin" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
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
                name: "BranchId",
                table: "Users");

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
        }
    }
}
