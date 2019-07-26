using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Codes.Services.UnitOfWork;

namespace Codes.Services.Core
{
    public interface IServiceBaseParameter<T> where T : class
    {
        IMapper Mapper { get; set; }
        IUnitOfWork<T> UnitOfWork { get; set; }
        IResponseResult ResponseResult { get; set; }
    }
}
