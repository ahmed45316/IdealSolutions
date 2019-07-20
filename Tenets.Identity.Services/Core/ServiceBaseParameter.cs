using AutoMapper;
using System;
using System.Collections.Generic;
using System.Text;
using Tenets.Common.Core;
using Tenets.Identity.Services.UnitOfWork;

namespace Tenets.Identity.Services.Core
{
    public class ServiceBaseParameter<T> : IServiceBaseParameter<T> where T : class
    {

        public ServiceBaseParameter(IMapper mapper, IUnitOfWork<T> unitOfWork, IResponseResult responseResult)
        {
            Mapper = mapper;
            UnitOfWork = unitOfWork;
            ResponseResult = responseResult;
        }

        public IMapper Mapper { get; set; }
        public IUnitOfWork<T> UnitOfWork { get; set; }
        public IResponseResult ResponseResult { get; set; }
    }
}
