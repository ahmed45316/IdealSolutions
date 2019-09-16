using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Transactions.Services.Dto
{
    public class CustomerDto
    {
        public string NameAr { get ; set ; }
        public string NameEn { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
