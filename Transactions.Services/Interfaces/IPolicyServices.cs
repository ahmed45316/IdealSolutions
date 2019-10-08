using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.Entities.Entites;
using Transactions.Services.Core;
using Transactions.Services.Dto;
using Transactions.Services.ReportsDto;

namespace Transactions.Services.Interfaces
{
    public interface IPolicyServices : IBaseService<Policy, PolicyDto>
    {
        Task<IDataPagging> GetAllPaggedAsync(BaseParam<PolicyFilter> filter);
        Task<IResult> GetByCustomerId(Guid customerId);
        Task<PolicyViewModel> GetPolicyForReport(Guid id);
    }
}
