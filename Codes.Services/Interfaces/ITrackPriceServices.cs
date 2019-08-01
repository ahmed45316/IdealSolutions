using Codes.Entities.Entities;
using Codes.Services.Core;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Interface;
using Tenets.Common.ServicesCommon.Codes.Parameters;

namespace Codes.Services.Interfaces
{
    public interface ITrackPriceServices : IBaseService<TrackPrice, ITrackPriceDto>
    {
        Task<IDataPagging> GetAllPaggedAsync(TrackPriceFilter filter);
    }
}
