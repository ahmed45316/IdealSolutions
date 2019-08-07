using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Tenets.Common.Core;

namespace Transactions.API.Controllers.Base
{
    /// <inheritdoc />
    public interface IMainEndPoint<TDto>
    {
        /// <inheritdoc />
        Task<IResult> GetAll();
        /// <inheritdoc />
        Task<IResult> Get(Guid id);
        /// <inheritdoc />
        Task<IResult> Add(TDto model);
        /// <inheritdoc />
        Task<IResult> Update(TDto model);
        /// <inheritdoc />
        Task<IResult> Remove(Guid id);
    }
}
