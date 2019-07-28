using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class RentDto : IRentDto
    {
        public string NameAr { get ; set ; }
        public string NameEn { get ; set ; }
        public int RentCode { get ; set ; }
        public string Phone { get ; set ; }
        public string Mobile { get ; set ; }
        public string Fax { get ; set ; }
        public string ResponsibleFor { get ; set ; }
        public string Address { get ; set ; }
        public string Email { get ; set ; }
        public bool IsWorking { get ; set ; }
        public string AccountCode { get ; set ; }
        public string CostCenter { get ; set ; }
        public Guid? Id { get ; set ; }
    }
}
