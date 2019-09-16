using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Enums;

namespace Transactions.Services.Dto
{
    public class NameByTypeDto
    {
        public OpeningBalanceType Type { get; set; }
        public Guid Id { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
    }
}
