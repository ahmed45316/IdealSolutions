using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Dto
{
    public class TrackDto : ITrackDto
    {
        public string NameAr { get ; set ; }
        public string NameEn { get ; set ; }
        public Guid Id { get ; set ; }
    }
}
