using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Tenets.Common.ServicesCommon.Codes.Parameters
{
    public class CityFilter:MainFilter
    {
        public Guid? CountryId { get; set; }
    }
}
