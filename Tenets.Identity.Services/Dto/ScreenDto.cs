using System;
using Tenets.Common.ServicesCommon.Identity.Interface;

namespace Tenets.Identity.Services.Dto
{
    public class ScreenDto : IScreenDto
    {
        public Guid Id { get; set; }
        public string ScreenNameAr { get; set; }
        public string ScreenNameEn { get; set; }
    }
}
