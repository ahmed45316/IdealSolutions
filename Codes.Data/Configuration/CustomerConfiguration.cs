using Codes.Entities.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Data.Configuration
{
    class CustomerConfiguration : IEntityTypeConfiguration<Customer>
    {
        public void Configure(EntityTypeBuilder<Customer> builder)
        {
            builder.HasIndex(u => u.CustomerCode).IsUnique();
            builder.Property(e => e.IsWorking).HasDefaultValueSql("0");
            builder.Property(e => e.IsOutSideCustomer).HasDefaultValueSql("0");
            builder.HasMany(c => c.TrackPrices).WithOne(r => r.Customer).OnDelete(DeleteBehavior.Restrict);


        }
    }
}
