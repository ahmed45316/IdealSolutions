using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Dto;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Parameters;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Codes.Services.Interfaces
{
    public interface ICarServices: IBaseService<Car, CarDto>
    {
        Task<IDataPagging> GetAllPaggedAsync(BaseParam<CarFilter> filter);
    }
}
