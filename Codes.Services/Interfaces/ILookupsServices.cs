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
        Task<IResult> GettrackSettingForPolicy(Guid customerId, DateTime policyDate);
        Task<IResult> GetCarTypesForPolicy(Guid customerId, DateTime policyDate, Guid trackSettingId);
    }
}
