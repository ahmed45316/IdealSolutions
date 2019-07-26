using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Codes.Entities.Entities
{
    public class TaxType:CommonPropertyEntity
    {
        public double Percentage { get; set; }
        [StringLength(128)]
        public string AccountCode { get; set; }
        [StringLength(128)]
        public string CostCenter { get; set; }
        public Guid TaxCategoryId { get; set; }
        [ForeignKey("TaxCategoryId")]
        public virtual TaxCategory TaxCategory { get; set; }
    }
}
