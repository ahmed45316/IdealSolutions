using Codes.Entities.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Data.Configuration
{
    class RepresentativeConfiguration: IEntityTypeConfiguration<Representative>
    {
        public void Configure(EntityTypeBuilder<Representative> builder)
        {
            builder.HasIndex(u => u.RepresentativeCode).IsUnique();
            builder.Property(e => e.IsWorking).HasDefaultValueSql("0");
            //builder.HasMany(c => c.Customers).WithOne(r => r.Representative).OnDelete(DeleteBehavior.SetNull);
        }
    }
}
