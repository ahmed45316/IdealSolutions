using CodeShellCore.Reporting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Transactions.Services.ReportsDto;

namespace Transactions.API.ReportModels
{
    public class PolicyReportModel : ReportModel
    {
        public IEnumerable<PolicyViewModel> Policies { get; set; }
        public override string Template => "Policy";
    }
}
