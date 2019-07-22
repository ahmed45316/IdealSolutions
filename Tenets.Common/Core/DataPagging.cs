using System;
using System.Collections.Generic;
using System.Text;

namespace Tenets.Common.Core
{
    public class DataPagging : IDataPagging
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalPage { get; set; }
        public IResult Result { get; set; }
        public DataPagging(int pageNumber, int pageSize, int totalPage, IResult result)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
            TotalPage = totalPage;
            Result = result;
        }
    }
}
