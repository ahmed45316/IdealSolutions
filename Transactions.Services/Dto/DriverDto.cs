using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;

namespace Transactions.Services.Dto
{
    public class DriverDto
    {
        public string NameAr { get; set; }
        public string NameEn { get; set; }
        public int DriverCode { get; set; } = new Random().Next(1000, 999999999);
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Fax { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public bool IsWorking { get; set; } = true;
        public string AccountCode { get; set; }
        public string CostCenter { get; set; }
        public Guid? Id { get; set; }
        public bool? IsOutSource { get; set; }
        public Guid? NationalityId { get; set; }
        public string IdentifacationNumber { get; set; }
    }
}
