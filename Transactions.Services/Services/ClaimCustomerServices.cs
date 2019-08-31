using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Http;
using Tenets.Common.ServicesCommon.Transaction.Interface;
using Transactions.Entities.Entites;
using Transactions.Services.Core;
using Transactions.Services.Interfaces;

namespace Transactions.Services.Services
{
    public class ClaimCustomerServices : BaseService<ClaimCustomer, IClaimCustomerDto>, IClaimCustomerServices
    {
        public ClaimCustomerServices(IServiceBaseParameter<ClaimCustomer> businessBaseParameter, IHttpContextAccessor httpContextAccessor) : base(businessBaseParameter, httpContextAccessor)
        {

        }

    }
}
