using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.ServicesCommon.Base
{
    public interface IDropdownDto
    {
         Guid? Id { get; set; }
         string NameAr { get; set; }
         string NameEn { get; set; }
         string TableName { get; set; }
    }
}
