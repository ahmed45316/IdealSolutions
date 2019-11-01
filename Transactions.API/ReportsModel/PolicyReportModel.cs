using CodeShellCore.Reporting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Transactions.Services.ReportsDto;

namespace Transactions.API.ReportModels
{
    /// <inheritdoc />
    public class PolicyReportModel : ReportModel
    {
        /// <inheritdoc />
        public IEnumerable<PolicyViewModel> Policies { get; set; }
        /// <inheritdoc />
        public override string Template => "Policy";
    }
}
