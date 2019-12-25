﻿// <auto-generated />
using System;
using Codes.Data.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Codes.Data.Migrations
{
    [DbContext(typeof(CodesContext))]
    [Migration("20191225223603_forignkeyrestrict")]
    partial class forignkeyrestrict
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.2.6-servicing-10079")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Codes.Entities.Entities.Branch", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("BranchGeneralLadgerId")
                        .HasMaxLength(128);

                    b.Property<Guid>("CompanyId");

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.HasIndex("CompanyId");

                    b.ToTable("Branches");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Car", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("CostCenter")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<string>("Model")
                        .HasMaxLength(64);

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("Notes")
                        .HasMaxLength(512);

                    b.Property<string>("PlateNumber")
                        .HasMaxLength(64);

                    b.HasKey("Id");

                    b.ToTable("Cars");
                });

            modelBuilder.Entity("Codes.Entities.Entities.CarType", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("CarTypes");
                });

            modelBuilder.Entity("Codes.Entities.Entities.City", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<Guid>("CountryId");

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.HasIndex("CountryId");

                    b.ToTable("Cities");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Company", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Address")
                        .HasMaxLength(256);

                    b.Property<string>("CompanyGeneralLadgerId")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<string>("Logo")
                        .HasMaxLength(128);

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.Property<string>("TaxNumber")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("Companies");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Country", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("CountryKey")
                        .HasMaxLength(8);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.Property<string>("NationalityAr")
                        .HasMaxLength(128);

                    b.Property<string>("NationalityEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("Countries");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Customer", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AccountCode")
                        .HasMaxLength(128);

                    b.Property<string>("Address")
                        .HasMaxLength(256);

                    b.Property<string>("CostCenter")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<int>("CustomerCode");

                    b.Property<string>("Email")
                        .HasMaxLength(64);

                    b.Property<string>("Fax")
                        .HasMaxLength(30);

                    b.Property<bool>("IsOutSideCustomer")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("0");

                    b.Property<bool>("IsWorking")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("0");

                    b.Property<string>("Mobile")
                        .HasMaxLength(20);

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.Property<string>("Phone")
                        .HasMaxLength(20);

                    b.Property<Guid>("RepresentativeId");

                    b.Property<string>("ResponsibleFor")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.HasIndex("CustomerCode")
                        .IsUnique();

                    b.HasIndex("RepresentativeId");

                    b.ToTable("Customers");
                });

            modelBuilder.Entity("Codes.Entities.Entities.CustomerCategory", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("CustomerCategories");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Driver", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AccountCode")
                        .HasMaxLength(128);

                    b.Property<string>("Address")
                        .HasMaxLength(256);

                    b.Property<string>("CostCenter")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<int>("DriverCode");

                    b.Property<string>("Email")
                        .HasMaxLength(64);

                    b.Property<string>("Fax")
                        .HasMaxLength(30);

                    b.Property<string>("IdentifacationNumber");

                    b.Property<bool?>("IsOutSource");

                    b.Property<bool>("IsWorking")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("0");

                    b.Property<string>("Mobile")
                        .HasMaxLength(20);

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.Property<Guid?>("NationalityId");

                    b.Property<string>("Phone")
                        .HasMaxLength(20);

                    b.HasKey("Id");

                    b.HasIndex("DriverCode")
                        .IsUnique();

                    b.HasIndex("NationalityId");

                    b.ToTable("Drivers");
                });

            modelBuilder.Entity("Codes.Entities.Entities.InvoiceType", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("InvoiceTypes");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Nationality", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("Nationalities");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Rent", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AccountCode")
                        .HasMaxLength(128);

                    b.Property<string>("Address")
                        .HasMaxLength(256);

                    b.Property<string>("CostCenter")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<string>("Email")
                        .HasMaxLength(64);

                    b.Property<string>("Fax")
                        .HasMaxLength(30);

                    b.Property<bool>("IsWorking")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("0");

                    b.Property<string>("Mobile")
                        .HasMaxLength(20);

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.Property<string>("Phone")
                        .HasMaxLength(20);

                    b.Property<int>("RentCode");

                    b.Property<string>("ResponsibleFor")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.HasIndex("RentCode")
                        .IsUnique();

                    b.ToTable("Rents");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Representative", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AccountCode")
                        .HasMaxLength(128);

                    b.Property<string>("Address")
                        .HasMaxLength(256);

                    b.Property<string>("CostCenter")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<string>("Email")
                        .HasMaxLength(64);

                    b.Property<string>("Fax")
                        .HasMaxLength(30);

                    b.Property<bool>("IsWorking")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValueSql("0");

                    b.Property<string>("Mobile")
                        .HasMaxLength(20);

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.Property<string>("Phone")
                        .HasMaxLength(20);

                    b.Property<int>("RepresentativeCode");

                    b.Property<string>("ResponsibleFor")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.HasIndex("RepresentativeCode")
                        .IsUnique();

                    b.ToTable("Representatives");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Setting", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("BankAccount")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<string>("DatabaseAccount")
                        .HasMaxLength(128);

                    b.Property<string>("FundAccount")
                        .HasMaxLength(128);

                    b.Property<string>("JournalEntry")
                        .HasMaxLength(128);

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("RevenueAccount")
                        .HasMaxLength(128);

                    b.Property<Guid>("TaxTypeId");

                    b.Property<string>("TransportCost")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.HasIndex("TaxTypeId");

                    b.ToTable("Setting");
                });

            modelBuilder.Entity("Codes.Entities.Entities.TaxCategory", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("TaxCategories");
                });

            modelBuilder.Entity("Codes.Entities.Entities.TaxType", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AccountCode")
                        .HasMaxLength(128);

                    b.Property<string>("CostCenter")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.Property<double>("Percentage");

                    b.Property<Guid>("TaxCategoryId");

                    b.HasKey("Id");

                    b.HasIndex("TaxCategoryId");

                    b.ToTable("TaxTypes");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Track", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("NameAr")
                        .HasMaxLength(128);

                    b.Property<string>("NameEn")
                        .HasMaxLength(128);

                    b.HasKey("Id");

                    b.ToTable("Tracks");
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackPrice", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<Guid>("CustomerId");

                    b.Property<DateTime?>("FromDate");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<decimal?>("OverNightPrice");

                    b.Property<decimal?>("RecallPrice");

                    b.Property<DateTime?>("ToDate");

                    b.Property<decimal?>("TownPrice");

                    b.HasKey("Id");

                    b.HasIndex("CustomerId");

                    b.ToTable("TrackPrices");
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackPriceDetail", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<Guid>("TrackPriceId");

                    b.Property<Guid>("TrackSettingId");

                    b.HasKey("Id");

                    b.HasIndex("TrackPriceId");

                    b.HasIndex("TrackSettingId");

                    b.ToTable("TrackPriceDetails");
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackPriceDetailCarType", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<Guid>("CarTypeId");

                    b.Property<double>("CarTypePrice");

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<Guid>("TrackPriceDetailId");

                    b.HasKey("Id");

                    b.HasIndex("CarTypeId");

                    b.HasIndex("TrackPriceDetailId");

                    b.ToTable("TrackPriceDetailCarTypes");
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackSetting", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<double>("DistanceByKilloMeters");

                    b.Property<decimal?>("DriverMotivation");

                    b.Property<Guid?>("FromTrackId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<Guid?>("ToTrackId");

                    b.Property<byte>("TrackSettingType");

                    b.HasKey("Id");

                    b.HasIndex("FromTrackId");

                    b.HasIndex("ToTrackId");

                    b.ToTable("TrackSetting");
                });

            modelBuilder.Entity("Codes.Entities.Entities.Branch", b =>
                {
                    b.HasOne("Codes.Entities.Entities.Company", "Company")
                        .WithMany("Branches")
                        .HasForeignKey("CompanyId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.City", b =>
                {
                    b.HasOne("Codes.Entities.Entities.Country", "Country")
                        .WithMany("Cities")
                        .HasForeignKey("CountryId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.Customer", b =>
                {
                    b.HasOne("Codes.Entities.Entities.Representative", "Representative")
                        .WithMany("Customers")
                        .HasForeignKey("RepresentativeId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.Driver", b =>
                {
                    b.HasOne("Codes.Entities.Entities.Nationality", "Nationality")
                        .WithMany("Drivers")
                        .HasForeignKey("NationalityId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.Setting", b =>
                {
                    b.HasOne("Codes.Entities.Entities.TaxType", "TaxType")
                        .WithMany("Settings")
                        .HasForeignKey("TaxTypeId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.TaxType", b =>
                {
                    b.HasOne("Codes.Entities.Entities.TaxCategory", "TaxCategory")
                        .WithMany("TaxTypes")
                        .HasForeignKey("TaxCategoryId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackPrice", b =>
                {
                    b.HasOne("Codes.Entities.Entities.Customer", "Customer")
                        .WithMany("TrackPrices")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackPriceDetail", b =>
                {
                    b.HasOne("Codes.Entities.Entities.TrackPrice", "TrackPrice")
                        .WithMany("TrackPriceDetails")
                        .HasForeignKey("TrackPriceId")
                        .OnDelete(DeleteBehavior.Restrict);

                    b.HasOne("Codes.Entities.Entities.TrackSetting", "TrackSetting")
                        .WithMany("TrackPriceDetails")
                        .HasForeignKey("TrackSettingId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackPriceDetailCarType", b =>
                {
                    b.HasOne("Codes.Entities.Entities.CarType", "CarType")
                        .WithMany("TrackPriceDetailCarTypes")
                        .HasForeignKey("CarTypeId")
                        .OnDelete(DeleteBehavior.Restrict);

                    b.HasOne("Codes.Entities.Entities.TrackPriceDetail", "TrackPriceDetail")
                        .WithMany("TrackPriceDetailCarTypes")
                        .HasForeignKey("TrackPriceDetailId")
                        .OnDelete(DeleteBehavior.Restrict);
                });

            modelBuilder.Entity("Codes.Entities.Entities.TrackSetting", b =>
                {
                    b.HasOne("Codes.Entities.Entities.Track", "FromTrack")
                        .WithMany()
                        .HasForeignKey("FromTrackId")
                        .OnDelete(DeleteBehavior.Restrict);

                    b.HasOne("Codes.Entities.Entities.Track", "ToTrack")
                        .WithMany()
                        .HasForeignKey("ToTrackId")
                        .OnDelete(DeleteBehavior.Restrict);
                });
#pragma warning restore 612, 618
        }
    }
}
