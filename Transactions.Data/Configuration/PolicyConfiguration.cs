using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using Transactions.Entities.Entities;

namespace Transactions.Data.Configuration
{
    class PolicyConfiguration : IEntityTypeConfiguration<Policy>
    {
        public void Configure(EntityTypeBuilder<Policy> builder)
        {
            builder.HasIndex(u => u.PolicyNumber).IsUnique();
           // builder.Property(o => o.PolicyNumber).HasDefaultValueSql("NEXT VALUE FOR PolicyNumbers");
        }
    }
}
