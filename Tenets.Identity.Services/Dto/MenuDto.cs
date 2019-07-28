using System;
using System.Collections.Generic;
using Tenets.Common.ServicesCommon.Identity.Interface;

namespace Tenets.Identity.Services.Dto
{
    public class MenuDto : IMenuDto
    {
        public Guid? Id { get; set; }
        public string ScreenNameAr { get; set; }
        public string ScreenNameEn { get; set; }
        public string Href { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Parameters { get; set; }
        public string Icon { get; set; }
        public int ItsOrder { get; set; }
        public List<IMenuDto> Children { get; set; }
    }
}
