using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Tenets.Common.ServicesCommon.Codes.Interface
{
    public interface IDriverDto : IPrimaryKeyField<Guid?>
    {
        string NameAr { get; set; }
        string NameEn { get; set; }
        int DriverCode { get; set; }
        string Phone { get; set; }
        string Mobile { get; set; }
        string Fax { get; set; }
        string Address { get; set; }
        string Email { get; set; }
        bool IsWorking { get; set; }
        string AccountCode { get; set; }
        string CostCenter { get; set; }
    }
}
