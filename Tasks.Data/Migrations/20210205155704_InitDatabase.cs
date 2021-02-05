using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Tasks.Data.Migrations
{
    public partial class InitDatabase : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Tasks",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    CreatedDate = table.Column<DateTime>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    TaskName = table.Column<string>(maxLength: 128, nullable: false),
                    EmployeeId = table.Column<Guid>(nullable: false),
                    FullEmployeeName = table.Column<string>(maxLength: 128, nullable: false),
                    DeadlineDate = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tasks", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Tasks");
        }
    }
}
