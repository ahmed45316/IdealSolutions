using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.ServicesCommon.Codes.Parameters
{
    public class SearchCriteriaFilter
    {
        public string SearchCriteria { get; set; }
        public bool? IsOutSource { get; set; } = false;
    }
}
