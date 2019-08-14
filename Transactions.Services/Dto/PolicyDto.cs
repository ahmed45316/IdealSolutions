using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Transaction.Interface;

namespace Transactions.Services.Dto
{
    public class PolicyDto : IPolicyDto
    {
        public Guid? Id { get; set; }
        public DateTime PolicyDateTime { get; set; }
        public DateTime? PolicyDateTimeHijri { get; set; }
        public byte PayType { get; set; }
        public string Notes { get; set; }
        public decimal? TotalTrackCost { get; set; }
        public decimal? TotalTrackValue { get; set; }
        public decimal? TotalOverNightPrice { get; set; }
        public decimal? TotalTownPrice { get; set; }
        public decimal? TotalRecallPrice { get; set; }
        public decimal? TotalDiscount { get; set; }
        public decimal? AllTotalPriceBeforTax { get; set; }
        public decimal? TotalTaxValue { get; set; }
        public decimal? AllTotalPriceAfterTax { get; set; }
        public virtual List<PolicyDetailDto> PolicyDetails { get; set; }
    }
}
