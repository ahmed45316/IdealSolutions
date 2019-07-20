using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Identity.Services.UnitOfWork;

namespace Tenets.Identity.Services.Core
{
    public interface IServiceBaseParameter<T> where T : class
    {
        IMapper Mapper { get; set; }
        IUnitOfWork<T> UnitOfWork { get; set; }
        IResponseResult ResponseResult { get; set; }
    }
}
