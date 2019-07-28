using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Common.ServicesCommon.Identity.Base;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface ICompanyDto : IPrimaryKeyField<Guid?>
    {
        string NameAr { get; set; }
        string NameEn { get; set; }
        string TaxNumber { get; set; }
        string Address { get; set; }
        string Logo { get; set; }
        string CompanyGeneralLadgerId { get; set; }
    }
}
