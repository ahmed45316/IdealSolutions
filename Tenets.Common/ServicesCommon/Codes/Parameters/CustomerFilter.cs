﻿using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Tenets.Common.ServicesCommon.Codes.Parameters
{
    public class CustomerFilter:MainFilter
    {
        public Guid? RepresentativeId { get; set; }
        public string Email { get; set; }
    }
}
