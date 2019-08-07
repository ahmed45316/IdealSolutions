using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Transaction.Interface;

namespace Transactions.Services.Dto
{
    public class PolicyDto : IPolicyDto
    {
        public Guid? Id { get; set; }
    }
}
