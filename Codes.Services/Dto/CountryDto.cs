using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Codes.Services.Dto
{
    public class CountryDto : IPrimaryKeyField<Guid?>
    {
        public string NameAr { get ; set ; }
        public string NameEn { get ; set ; }
        public string CountryKey { get ; set ; }
        public string NationalityAr { get ; set ; }
        public string NationalityEn { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
