using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.Extensions
{
    public class SortModel
    {
        public string ColId { get; set; } = "id";
        public string Sort { get; set; } = "asc";
        public string PairAsSqlExpression
        {
            get
            {
                return $"{ColId} {Sort}";
            }
        }
    }
}
