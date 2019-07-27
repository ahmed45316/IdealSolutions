using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface IInvoiceTypeDto: IPrimaryKeyField<Guid>
    {
        string NameAr { get; set; }
        string NameEn { get; set; }
    }
}
