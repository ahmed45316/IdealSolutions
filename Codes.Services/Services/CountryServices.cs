using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Services
{
    public class CountryServices : BaseService<Country, ICountryDto>, ICountryServices
    {
        public CountryServices(IServiceBaseParameter<Country> businessBaseParameter) : base(businessBaseParameter)
        {

        }
    }
}
