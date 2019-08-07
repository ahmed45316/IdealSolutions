using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Transactions.Entities.Entities.Base;

namespace Transactions.Entities.Entites
{
    public class Policy:BaseEntity
    {
        public DateTime PolicyDateTime { get; set; }
        public DateTime? PolicyDateTimeHijri { get; set; }
        public byte PayType { get; set; }
        [StringLength(512)]
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
    }
}
