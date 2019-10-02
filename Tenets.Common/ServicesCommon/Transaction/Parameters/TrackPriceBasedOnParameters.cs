using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.ServicesCommon.Transaction.Parameters
{
    public class TrackPriceBasedOnParameters
    {
        public Guid CustomerId { get; set; }
        public DateTime PolicyDate { get; set; }
        public Guid? TrackSettingId { get; set; }
        public Guid? Id { get; set; }
    }
}
