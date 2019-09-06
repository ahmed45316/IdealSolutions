using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;
using Tenets.Common.ServicesCommon.Transaction.Interface;
using Tenets.Common.ServicesCommon.Transaction.Parameters;
using Transactions.Entities.Entites;
using Transactions.Services.Core;

namespace Transactions.Services.Interfaces
{
    public interface IOpeningBalanceServices : IBaseService<OpeningBalance, IOpeningBalanceDto>
    {
        Task<IDataPagging> GetAllPaggedAsync(BaseParam<OpeningBalanceFilter> filter);

    }
}
