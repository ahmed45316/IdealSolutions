using Codes.Entities.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Data.Configuration
{
    class DriverConfiguration : IEntityTypeConfiguration<Driver>
    {
        public void Configure(EntityTypeBuilder<Driver> builder)
        {
            builder.HasIndex(u => u.DriverCode).IsUnique();
            builder.Property(e => e.IsWorking).HasDefaultValueSql("0");
        }
    }
}
