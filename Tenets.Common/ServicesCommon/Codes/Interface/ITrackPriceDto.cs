using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ITrackPriceDto : IPrimaryKeyField<Guid>
    {
        Guid CustomerId { get; set; }
        Guid? FromTrackId { get; set; }
        Guid? ToTrackId { get; set; }

    }
}
