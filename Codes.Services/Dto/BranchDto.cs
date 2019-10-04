using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Services.Dto
{
    public class BranchDto : IPrimaryKeyField<Guid?>
    {
        public string NameAr { get ; set ; }
        public string NameEn { get ; set ; }
        public Guid CompanyId { get ; set ; }
        public string BranchGeneralLadgerId { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
