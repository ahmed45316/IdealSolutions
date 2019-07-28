using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class BranchDto : IBranchDto
    {
        public string NameAr { get ; set ; }
        public string NameEn { get ; set ; }
        public Guid CompanyId { get ; set ; }
        public string BranchGeneralLadgerId { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
