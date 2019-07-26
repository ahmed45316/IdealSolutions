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
            builder.Property(e => e.IsWorking).HasDefaultValueSql("false");
            builder.Property(e => e.IsOutSideCustomer).HasDefaultValueSql("false");
        }
    }
}
