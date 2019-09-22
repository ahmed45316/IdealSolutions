using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;
using Transactions.Entities.Entites;

namespace Transactions.Data.Configuration
{
    class PolicyDetailsConfiguration : IEntityTypeConfiguration<PolicyDetail>
    {
        public void Configure(EntityTypeBuilder<PolicyDetail> builder)
        {
            builder.HasIndex(u => u.PolicyNumber).IsUnique();
        }
    }
}
