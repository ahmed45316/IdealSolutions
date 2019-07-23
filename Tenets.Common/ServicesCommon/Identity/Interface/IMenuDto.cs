using System;
using System.Collections.Generic;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Identity.Interface
{
    public interface IMenuDto: IPrimaryKeyField<Guid>
    {
        string ScreenNameAr { get; set; }
        string ScreenNameEn { get; set; }
        string Href { get; set; }
        string Controller { get; set; }
        string Action { get; set; }
        string Parameters { get; set; }
        string Icon { get; set; }
        int ItsOrder { get; set; }
        List<IMenuDto> Children { get; set; }
    }
}
