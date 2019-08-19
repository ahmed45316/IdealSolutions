using System;
using System.Collections.Generic;
using System.Text;

namespace Codes.Services.Dto
{
    public class LookupsDto
    {
        public IEnumerable<DropdownDto> InvoiceType { get; set; }
        public IEnumerable<DropdownDto> Car { get; set; }
        public IEnumerable<DropdownDto> CarType { get; set; }
        public IEnumerable<DropdownDto> CustomerCategory { get; set; }
        public IEnumerable<DropdownDto> TrackSetting { get; set; }
        public IEnumerable<DropdownDto> TaxType { get; set; }

    }
}
