using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Services.Dto
{
    public class TaxTypeDto : IPrimaryKeyField<Guid?>
    {
        public string NameAr { get ; set ; }
        public string NameEn { get ; set ; }
        public double Percentage { get ; set ; }
        public string AccountCode { get ; set ; }
        public string CostCenter { get ; set ; }
        public Guid TaxCategoryId { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
