using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Services
{
    public class RentServices : BaseService<Rent, IRentDto>, IRentServices
    {
        public RentServices(IServiceBaseParameter<Rent> businessBaseParameter) : base(businessBaseParameter)
        {

        }
    }
}
