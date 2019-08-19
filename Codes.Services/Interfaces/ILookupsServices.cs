﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;

namespace Codes.Services.Interfaces
{
    public interface ILookupsServices
    {
        Task<IResult> GetAllLookupsForPolicy();
    }
}
