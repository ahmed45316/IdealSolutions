using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Services.Dto
{
    public class CarDto : IPrimaryKeyField<Guid?>
    {
        public string PlateNumber { get ; set ; }
        public string ModelName { get ; set ; }
        public string Notes { get ; set ; }
        public string CostCenter { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
