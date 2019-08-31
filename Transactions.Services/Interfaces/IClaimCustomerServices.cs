using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Transaction.Interface;
using Transactions.Entities.Entites;
using Transactions.Services.Core;

namespace Transactions.Services.Interfaces
{
    public interface IClaimCustomerServices : IBaseService<ClaimCustomer, IClaimCustomerDto>
    {
    }
}
