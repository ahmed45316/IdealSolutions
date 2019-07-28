using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class TaxTypeDto : ITaxTypeDto
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
