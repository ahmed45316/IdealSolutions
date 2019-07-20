using System.Collections.Generic;
using Tenets.Common.Extensions;

namespace Tenets.Common.Identity.Parameters
{
    public class BaseParam
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public IEnumerable<SortModel> OrderByValue { get; set; }
    }
}
