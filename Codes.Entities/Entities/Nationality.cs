using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Entities.Entities
{
    public class Nationality : CommonPropertyEntity
    {
        public virtual ICollection<Driver> Drivers { get; set; }
    }
}
