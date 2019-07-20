using System;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Identity.Parameters;
using Tenets.Common.OptionModel;

namespace Tenets.Identity.Services.Interfaces
{
    public interface IMenuServices
    {
        Task<IResponseResult> GetMenu(Guid userId);
        Task<Select2PagedResult> GetScreensSelect2(string searchTerm, int pageSize, int pageNumber, string lang);
        Task<Select2PagedResult> GetChildScreensSelect2(string searchTerm, int pageSize, int pageNumber, Guid? parentId, string lang);
        Task<IResponseResult> GetScreens(Guid? roleId, Guid? menuId, Guid? childId);
        Task<IResponseResult> GetScreensSelected(Guid? roleId, Guid? menuId, Guid? childId);
        Task<IResponseResult> SaveScreens(ScreensAssignedParameters parameters);
    }
}
