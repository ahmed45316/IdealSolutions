using Codes.Entities.Entities;
using Codes.Services.Core;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Codes.Interface;
using Tenets.Common.ServicesCommon.Codes.Parameters;

namespace Codes.Services.Interfaces
{
    public interface ICarServices: IBaseService<Car, ICarDto>
    {
        Task<IDataPagging> GetAllPaggedAsync(CarFilter filter);
    }
}
