using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Services.Dto
{
    public class CompanyDto : IPrimaryKeyField<Guid?>
    {
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public string TaxNumber { get; set; }
        public string Address { get; set; }
        public string Logo { get; set; }
        public string CompanyGeneralLadgerId { get; set; }
        public Guid? Id { get; set; }
    }
}
