using System;
using System.Threading.Tasks;
using Tenets.Common.Core;

namespace Codes.API.Controllers.Base
{
    /// <summary>
    /// Main ENd Point INterface
    /// </summary>
    /// <typeparam name="TDto"></typeparam>
    public interface IMainEndPoint<TDto>
    {
        /// <summary>
        /// Get All
        /// </summary>
        /// <returns></returns>
        Task<IResult> GetAll();
        /// <summary>
        /// Get By Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<IResult> Get(Guid id);
        /// <summary>
        /// Add
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        Task<IResult> Add(TDto model);
        /// <summary>
        /// Update
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        Task<IResult> Update(TDto model);
        /// <summary>
        /// Delete
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<IResult> Remove(Guid id);
    }
}
