using Codes.Entities.Entities;
using Codes.Services.Core;
using Codes.Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Services
{
    public class TrackServices : BaseService<Track, ITrackDto>, ITrackServices
    {
        public TrackServices(IServiceBaseParameter<Track> businessBaseParameter) : base(businessBaseParameter)
        {

        }
    }
}
