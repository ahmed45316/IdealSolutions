using System;
using Tenets.Common.Identity.Interface;

namespace Tenets.Common.Identity.Dto
{
    public class ScreenDto : IScreenDto
    {
        public Guid Id { get; set; }
        public string ScreenNameAr { get; set; }
        public string ScreenNameEn { get; set; }
    }
}
