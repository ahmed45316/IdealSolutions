﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Tenets.Identity.Data.Context;

namespace Tenets.Identity.Data.Migrations
{
    [DbContext(typeof(IdentityContext))]
    partial class IdentityContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.2.6-servicing-10079")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Tenets.Identity.Entities.Role", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<bool>("IsDeleted");

                    b.Property<DateTime?>("LastAccessed")
                        .ValueGeneratedOnAddOrUpdate();

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(256);

                    b.HasKey("Id");

                    b.ToTable("Roles");

                    b.HasData(
                        new
                        {
                            Id = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                            IsDeleted = false,
                            LastAccessed = new DateTime(2019, 12, 26, 0, 35, 32, 868, DateTimeKind.Local).AddTicks(4590),
                            Name = "SuperAdmin"
                        },
                        new
                        {
                            Id = new Guid("c31c91c0-5c2f-45cc-ab6d-1d256538a6ee"),
                            IsDeleted = false,
                            LastAccessed = new DateTime(2019, 12, 26, 0, 35, 32, 868, DateTimeKind.Local).AddTicks(5087),
                            Name = "Admin"
                        },
                        new
                        {
                            Id = new Guid("c41c91c0-5c2f-45cc-ab6d-1d256538a7ee"),
                            IsDeleted = false,
                            LastAccessed = new DateTime(2019, 12, 26, 0, 35, 32, 868, DateTimeKind.Local).AddTicks(5104),
                            Name = "User"
                        });
                });

            modelBuilder.Entity("Tenets.Identity.Entities.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<Guid>("BranchId");

                    b.Property<string>("Email")
                        .HasMaxLength(256);

                    b.Property<bool>("IsDeleted");

                    b.Property<DateTime?>("LastAccessed")
                        .ValueGeneratedOnAddOrUpdate();

                    b.Property<string>("Password");

                    b.Property<string>("PhoneNumber");

                    b.Property<Guid>("RoleId");

                    b.Property<string>("UserName")
                        .IsRequired()
                        .HasMaxLength(256);

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("Users");

                    b.HasData(
                        new
                        {
                            Id = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a4ee"),
                            BranchId = new Guid("00000000-0000-0000-0000-000000000000"),
                            Email = "admin@A3n.com",
                            IsDeleted = false,
                            LastAccessed = new DateTime(2019, 12, 26, 0, 35, 32, 861, DateTimeKind.Local).AddTicks(4783),
                            Password = "AGN0ES4N0iO5O3AvvIT751Lt/ZyckQKfE8cN1bVGr5eRclbKiO4S0c0EDnQTzccvvQ==",
                            PhoneNumber = "+9",
                            RoleId = new Guid("c21c91c0-5c2f-45cc-ab6d-1d256538a5ee"),
                            UserName = "admin"
                        });
                });

            modelBuilder.Entity("Tenets.Identity.Entities.User", b =>
                {
                    b.HasOne("Tenets.Identity.Entities.Role", "Role")
                        .WithMany("Users")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Restrict);
                });
#pragma warning restore 612, 618
        }
    }
}
