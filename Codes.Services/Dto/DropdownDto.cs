using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Base;

namespace Codes.Services.Dto
{
    public class DropdownDto: IDropdownDto
    {
        public Guid? Id { get; set; }
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public string TableName { get; set; }
    }
}
