using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ICarDto : IPrimaryKeyField<Guid?>
    {
         string PlateNumber { get; set; }
         string Model { get; set; }
         string Notes { get; set; }
         string CostCenter { get; set; }
    }
}
