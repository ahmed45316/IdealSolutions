using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Services
{
    public class CityServices : BaseService<City, ICityDto>, ICityServices
    {
        public CityServices(IServiceBaseParameter<City> businessBaseParameter) : base(businessBaseParameter)
        {

        }
    }
}
