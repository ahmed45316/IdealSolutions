using System.Collections.Generic;
using Tenets.Common.Extensions;

namespace Tenets.Common.ServicesCommon.Identity.Base
{
    public class BaseParam
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int Count { get; set; }
        public IEnumerable<SortModel> OrderByValue { get; set; }
    }
}
