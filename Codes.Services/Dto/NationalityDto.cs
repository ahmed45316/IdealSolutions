﻿using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Services.Dto
{
    public class NationalityDto : IPrimaryKeyField<Guid?>
    {
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public Guid? Id { get; set; }
    }
}