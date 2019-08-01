using Codes.Entities.Entities;
using Codes.Services.Core;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Interface;
using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Interfaces
{
    public interface IBranchServices : IBaseService<Branch, IBranchDto>
    {
        Task<IDataPagging> GetAllPaggedAsync(BaseParam<BranchFilter> filter);
    }
}
