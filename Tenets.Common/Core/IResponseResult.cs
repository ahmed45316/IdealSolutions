using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace Tenets.Common.Core
{
    public interface IResponseResult : IResult
    {
        IResult PostResult(object result = null,
            HttpStatusCode status = HttpStatusCode.BadRequest, Exception exception = null,
            string message = null);
    }
}
