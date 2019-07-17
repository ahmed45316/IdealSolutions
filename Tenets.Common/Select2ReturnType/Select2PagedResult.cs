using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.OptionModel
{
   public class Select2PagedResult
    {
        public int Total { get; set; }

        public List<Select2OptionModel> Results { get; set; }
    }
}
