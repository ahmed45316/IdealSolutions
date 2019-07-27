using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ITaxTypeDto : IPrimaryKeyField<Guid>
    {
        string NameAr { get; set; }
        string NameEn { get; set; }
        double Percentage { get; set; }
        string AccountCode { get; set; }
        string CostCenter { get; set; }
        Guid TaxCategoryId { get; set; }
    }
}
