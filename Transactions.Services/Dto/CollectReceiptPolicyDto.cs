﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Transactions.Services.Dto
{
    public class CollectReceiptPolicyDto
    {
        public Guid? Id { get; set; }
        public DateTime? PolicyDatetime { get; set; }
        public string PolicyNumber { get; set; }
        public decimal? TotalPriceAfterTax { get; set; }
        public decimal? PreviouslyPaidForCollect { get; set; }
        public decimal ResidualForCollect { get; set; }
        public decimal? PreviouslyPaidForReceipt { get; set; }
        public decimal ResidualForReceipt { get; set; }
    }
}
