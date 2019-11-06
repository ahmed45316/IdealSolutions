using CodeShellCore.Web;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace Transactions.API
{
    /// <inheritdoc />
    public class TransactionShell : WebShell
    {
        /// <inheritdoc />
        public TransactionShell(IConfiguration configuration) :base(configuration)
        {
            
        }
        /// <inheritdoc />
        protected override bool useLocalization { get { return false; } }
        /// <inheritdoc />

        protected override CultureInfo defaultCulture { get; }
    }
}
