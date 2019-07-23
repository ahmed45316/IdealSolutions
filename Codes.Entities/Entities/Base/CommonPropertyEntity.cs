using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Codes.Entities.Entities.Base
{
    public class CommonPropertyEntity:BaseEntity
    {
        [StringLength(128)]
        public string NameAr { get; set; }
        [StringLength(128)]
        public string NameEn { get; set; }
    }
}
