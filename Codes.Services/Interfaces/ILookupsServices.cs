using Codes.Services.Dto;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;

namespace Codes.Services.Interfaces
{
    public interface ILookupsServices
    {
        Task<IResult> GetAllLookupsForPolicy();
        Task<IResult> GetTypeNameForOpeningBalance(IEnumerable<OpeningBalanceParameters> parameters);
    }
}
