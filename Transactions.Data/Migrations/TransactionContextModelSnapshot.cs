﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Transactions.Data.Context;

namespace Transactions.Data.Migrations
{
    [DbContext(typeof(TransactionContext))]
    partial class TransactionContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.2.6-servicing-10079")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Transactions.Entities.Entites.ClaimCustomer", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("ClaimCustomerDate");

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<Guid>("CustomerId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("Notes")
                        .HasMaxLength(512);

                    b.Property<Guid>("PolicyId");

                    b.Property<decimal>("Tax");

                    b.Property<decimal>("Total");

                    b.Property<decimal>("TotalAfterTax");

                    b.HasKey("Id");

                    b.HasIndex("PolicyId");

                    b.ToTable("ClaimCustomers");
                });

            modelBuilder.Entity("Transactions.Entities.Entites.CollectReceipt", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("AccountCode")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CollectReceiptDate");

                    b.Property<DateTime?>("CollectReceiptDateHegry");

                    b.Property<string>("CollectReceiptNumber");

                    b.Property<int>("CollectReceiptType");

                    b.Property<string>("CostCenter")
                        .HasMaxLength(128);

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<Guid>("CustomerId");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("Notes")
                        .HasMaxLength(512);

                    b.Property<decimal>("Paid");

                    b.Property<int>("PaymentType");

                    b.Property<Guid>("PolicyId");

                    b.HasKey("Id");

                    b.HasIndex("CollectReceiptNumber")
                        .IsUnique()
                        .HasFilter("[CollectReceiptNumber] IS NOT NULL");

                    b.HasIndex("PolicyId");

                    b.ToTable("CollectReceipts");
                });

            modelBuilder.Entity("Transactions.Entities.Entites.OpeningBalance", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<int>("DebitCridet");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("Notes")
                        .HasMaxLength(512);

                    b.Property<DateTime>("OpeningBlanceDate");

                    b.Property<int>("Type");

                    b.Property<Guid>("TypeId");

                    b.Property<decimal>("Value");

                    b.HasKey("Id");

                    b.ToTable("OpeningBalances");
                });

            modelBuilder.Entity("Transactions.Entities.Entites.Policy", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd();

                    b.Property<Guid>("BranchId");

                    b.Property<Guid>("CarId");

                    b.Property<string>("CarNo")
                        .HasMaxLength(16);

                    b.Property<Guid>("CarTypeId");

                    b.Property<string>("ColdNumber");

                    b.Property<DateTime>("CreateDate");

                    b.Property<Guid>("CreateUserId");

                    b.Property<Guid>("CustomerCategoryId");

                    b.Property<Guid>("CustomerId");

                    b.Property<decimal?>("Discount");

                    b.Property<Guid?>("DriverId");

                    b.Property<string>("DriverName");

                    b.Property<Guid?>("DriverNationalityId");

                    b.Property<string>("DriverPhone");

                    b.Property<Guid>("InvoicTypeId");

                    b.Property<bool>("IsRentedCar");

                    b.Property<string>("ManafestNumber");

                    b.Property<DateTime?>("ModifyDate");

                    b.Property<Guid?>("ModifyUserId");

                    b.Property<string>("Notes")
                        .HasMaxLength(512);

                    b.Property<decimal?>("OverNightPrice");

                    b.Property<DateTime?>("PolicyDatetime");

                    b.Property<long>("PolicyNumber");

                    b.Property<decimal?>("RecallPrice");

                    b.Property<Guid>("RepresentativeId");

                    b.Property<Guid?>("RequestPaymentId");

                    b.Property<long?>("THeadId");

                    b.Property<Guid>("TaxTypeId");

                    b.Property<decimal?>("TaxValue");

                    b.Property<decimal?>("TotalPriceAfterTax");

                    b.Property<decimal?>("TotalPriceBeforTax");

                    b.Property<decimal?>("TownPrice");

                    b.Property<decimal?>("TrackCost");

                    b.Property<Guid>("TrackSettingId");

                    b.Property<decimal?>("TrackValue");

                    b.HasKey("Id");

                    b.HasIndex("PolicyNumber")
                        .IsUnique();

                    b.ToTable("Policies");
                });

            modelBuilder.Entity("Transactions.Entities.Entites.ClaimCustomer", b =>
                {
                    b.HasOne("Transactions.Entities.Entites.Policy", "Policy")
                        .WithMany("ClaimCustomers")
                        .HasForeignKey("PolicyId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("Transactions.Entities.Entites.CollectReceipt", b =>
                {
                    b.HasOne("Transactions.Entities.Entites.Policy", "Policy")
                        .WithMany("CollectReceipts")
                        .HasForeignKey("PolicyId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
#pragma warning restore 612, 618
        }
    }
}
