﻿using System;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Identity.Interface
{
    public interface IScreenDto : IPrimaryKeyField<Guid?>
    {
        string ScreenNameAr { get; set; }
        string ScreenNameEn { get; set; }
    }
}
