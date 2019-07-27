﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Codes.API.Controllers.Base;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Tenets.Common.Core;

namespace Codes.API.Controllers
{
    /// <inheritdoc />
    public class RentController : BaseController,IMainEndPoint<RentDto>
    {
        private readonly IRentServices _RentServices;
        /// <inheritdoc />
        public RentController(IRentServices RentServices)
        {
            _RentServices = RentServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        public async Task<IResult> Add(RentDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _RentServices.AddAsync(model, userId);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        public async Task<IResult> Get(Guid id)
        {
            return await _RentServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        public async Task<IResult> GetAll()
        {
            return await _RentServices.GetAllAsync();
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        public async Task<IResult> Remove(Guid id)
        {
            return await _RentServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        public async Task<IResult> Update(RentDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _RentServices.UpdateAsync(model, userId);
        }
    }
}