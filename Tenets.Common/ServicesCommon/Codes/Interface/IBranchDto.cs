using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface IBranchDto : IPrimaryKeyField<Guid?>
    {
        string NameAr { get; set; }
        string NameEn { get; set; }
        Guid CompanyId { get; set; }
        string BranchGeneralLadgerId { get; set; }
    }
}
