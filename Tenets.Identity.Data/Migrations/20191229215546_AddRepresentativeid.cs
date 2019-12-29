using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Tenets.Identity.Data.Migrations
{
    public partial class AddRepresentativeid : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DeleteData(
            //    table: "Roles",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"));

            //migrationBuilder.DeleteData(
            //    table: "Roles",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"));

            //migrationBuilder.DeleteData(
            //    table: "Users",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"));

            //migrationBuilder.DeleteData(
            //    table: "Roles",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.AddColumn<Guid>(
                name: "RepresentativeId",
                table: "Users",
                nullable: true);

            //migrationBuilder.InsertData(
            //    table: "Roles",
            //    columns: new[] { "Id", "IsDeleted", "Name" },
            //    values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), false, "SuperAdmin" });

            //migrationBuilder.InsertData(
            //    table: "Roles",
            //    columns: new[] { "Id", "IsDeleted", "Name" },
            //    values: new object[] { new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"), false, "Admin" });

            //migrationBuilder.InsertData(
            //    table: "Roles",
            //    columns: new[] { "Id", "IsDeleted", "Name" },
            //    values: new object[] { new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"), false, "User" });

            //migrationBuilder.InsertData(
            //    table: "Users",
            //    columns: new[] { "Id", "BranchId", "Email", "IsDeleted", "Password", "PhoneNumber", "RepresentativeId", "RoleId", "UserName" },
            //    values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"), new Guid("00000000-0000-0000-0000-000000000000"), "admin@A3n.com", false, "AIwitjOH76yImoxOIAjZwuzbGZopN6pdJIg1SzAFkKym5PAomRqO23QQlJepzzZVSg==", "+9", null, new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "admin" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DeleteData(
            //    table: "Roles",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"));

            //migrationBuilder.DeleteData(
            //    table: "Roles",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"));

            //migrationBuilder.DeleteData(
            //    table: "Users",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"));

            //migrationBuilder.DeleteData(
            //    table: "Roles",
            //    keyColumn: "Id",
            //    keyValue: new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"));

            migrationBuilder.DropColumn(
                name: "RepresentativeId",
                table: "Users");

            //migrationBuilder.InsertData(
            //    table: "Roles",
            //    columns: new[] { "Id", "IsDeleted", "Name" },
            //    values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), false, "SuperAdmin" });

            //migrationBuilder.InsertData(
            //    table: "Roles",
            //    columns: new[] { "Id", "IsDeleted", "Name" },
            //    values: new object[] { new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"), false, "Admin" });

            //migrationBuilder.InsertData(
            //    table: "Roles",
            //    columns: new[] { "Id", "IsDeleted", "Name" },
            //    values: new object[] { new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"), false, "User" });

            //migrationBuilder.InsertData(
            //    table: "Users",
            //    columns: new[] { "Id", "BranchId", "Email", "IsDeleted", "Password", "PhoneNumber", "RoleId", "UserName" },
            //    values: new object[] { new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"), new Guid("00000000-0000-0000-0000-000000000000"), "admin@A3n.com", false, "AGN0ES4N0iO5O3AvvIT751Lt/ZyckQKfE8cN1bVGr5eRclbKiO4S0c0EDnQTzccvvQ==", "+9", new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"), "admin" });
        }
    }
}
