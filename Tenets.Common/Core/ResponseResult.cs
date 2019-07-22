using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace Tenets.Common.Core
{
   
    public class ResponseResult : Result, IResponseResult
    {
        public ResponseResult(object result = null, HttpStatusCode status = HttpStatusCode.BadRequest, Exception exception = null, string message = null)
        {
            Data = result;
            Exception = exception;
            Message = message;
            Status = status;
        }

        public IResult PostResult(object result = null, HttpStatusCode status = HttpStatusCode.BadRequest, Exception exception = null, string message = null)
        {
            return new ResponseResult(result: result, status: status, exception: exception, message: message);
        }

    }
}
