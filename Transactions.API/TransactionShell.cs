using CodeShellCore.Web;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace Transactions.API
{
    public class TransactionShell : WebShell
    {
        public TransactionShell(IConfiguration configuration) :base(configuration)
        {
            
        }
        protected override bool useLocalization { get { return false; } }

        protected override CultureInfo defaultCulture { get; }
    }
}
