﻿using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Base;

namespace Tenets.Common.ServicesCommon.Transaction.Parameters
{
   public class PolicyFilter
    {
        public DateTime? PolicyDatetime { get; set; }
        public Guid? CustomerId { get; set; }
        public Guid? InvoicTypeId { get; set; }
        public Guid? CustomerCategoryId { get; set; }
        public string PolicyNumber { get; set; }
    }
}
