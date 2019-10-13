using System;
using System.Collections.Generic;
using System.Text;

namespace Transactions.Services.ReportsDto
{
    public class PolicyViewModel
    {
        public string CustomerNameAr { get; set; }
        public DateTime? PolicyDatetime { get; set; }
        public long PolicyNumber { get; set; }
        public string TrackName { get; set; }
        public string CarTypeName { get; set; }
        public string DriverName { get; set; }
        public string Nationality { get; set; }
        public string TelNumber { get; set; }
        public string Notes { get; set; }
        public string CarNo { get; set; }
        public string ColdNumber { get; set; }
        public string IdentifactionNumber { get; set; }

    }
}
