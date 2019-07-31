using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Tenets.Common.ServicesCommon.Codes.Parameters
{
    public class BranchSearchCriteriaParameters:BaseParam
    {
        public Guid? CompanyId { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
    }
}
