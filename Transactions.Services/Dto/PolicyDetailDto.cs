using System;
using System.Collections.Generic;
using System.Text;

namespace Transactions.Services.Dto
{
   public class PolicyDetailDto
    {
        public Guid? Id { get; set; }
        public Guid PolicyId { get; set; }
        public Guid CustomerId { get; set; }
        public Guid CustomerCategoryId { get; set; }
        public Guid InvoicTypeId { get; set; }
        public DateTime? PolicyDetailDatetime { get; set; }
        public string PolicyNumber { get; set; }
        public Guid RepresentativeId { get; set; }
        public Guid CarId { get; set; }
        public Guid CarTypeId { get; set; }
        public Guid TrackSettingId { get; set; }
        public decimal? TrackCost { get; set; }
        public decimal? TrackValue { get; set; }
        public decimal? OverNightPrice { get; set; }
        public decimal? TownPrice { get; set; }
        public decimal? RecallPrice { get; set; }
        public decimal? Discount { get; set; }
        public decimal? TotalPriceBeforTax { get; set; }
        public Guid TaxTypeId { get; set; }
        public decimal? TaxValue { get; set; }
        public decimal? TotalPriceAfterTax { get; set; }
        public string Notes { get; set; }
        public bool IsRentedCar { get; set; } = false;
        public string CarNo { get; set; }
    }
}
