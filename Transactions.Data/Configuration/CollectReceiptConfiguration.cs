﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Transactions.Entities.Entities;

namespace Transactions.Data.Configuration
{
    class CollectReceiptConfiguration : IEntityTypeConfiguration<CollectReceipt>
    {
        public void Configure(EntityTypeBuilder<CollectReceipt> builder)
        {
            builder.HasIndex(u => u.CollectReceiptNumber).IsUnique();
        }
    }
}
