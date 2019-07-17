using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace Tenets.Common.Core
{   
    public class HandlerResponse : IHandlerResponse
    {
        private readonly IResult _result;

        public HandlerResponse(IResult result)
        {
            _result = result;
        }
        public IResult GetResult(IResponseResult responseResult)
        {
            _result.Status = responseResult.Status;
            _result.Message = responseResult.Message;
            if (!HasError(responseResult.Exception))
            {
                _result.Data = responseResult.Data;
                
            }

            return _result;
        }
        private bool HasError(Exception exception)
        {
            return exception != null;
        }

    }
}
