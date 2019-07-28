using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class CarDto : ICarDto
    {
        public string PlateNumber { get ; set ; }
        public string Model { get ; set ; }
        public string Notes { get ; set ; }
        public string CostCenter { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
