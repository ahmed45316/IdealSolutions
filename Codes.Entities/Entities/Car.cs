using Codes.Entities.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Codes.Entities.Entities
{
    public class Car:BaseEntity
    {
        [StringLength(64)]
        public string PlateNumber { get; set; }
        [StringLength(64)]
        public string Model { get; set; }
        [StringLength(512)]
        public string Notes { get; set; }
        [StringLength(128)]
        public string CostCenter { get; set; }
    }
}
