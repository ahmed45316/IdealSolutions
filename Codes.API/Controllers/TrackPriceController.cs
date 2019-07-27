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
    public class TrackPriceController : BaseController,IMainEndPoint<TrackPriceDto>
    {
        private readonly ITrackPriceServices _TrackPriceServices;
        /// <inheritdoc />
        public TrackPriceController(ITrackPriceServices TrackPriceServices)
        {
            _TrackPriceServices = TrackPriceServices;
        }
        /// <summary>
        /// Add data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        public async Task<IResult> Add(TrackPriceDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _TrackPriceServices.AddAsync(model, userId);
        }
        /// <summary>
        /// Get data by Id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        public async Task<IResult> Get(Guid id)
        {
            return await _TrackPriceServices.GetByIdAsync(id);
        }
        /// <summary>
        /// GetAll Data
        /// </summary>
        /// <returns></returns>
        public async Task<IResult> GetAll()
        {
            return await _TrackPriceServices.GetAllAsync();
        }
        /// <summary>
        /// Remove data by id
        /// </summary>
        /// <param name="id">PK</param>
        /// <returns></returns>
        public async Task<IResult> Remove(Guid id)
        {
            return await _TrackPriceServices.DeleteAsync(id);
        }
        /// <summary>
        /// Update data 
        /// </summary>
        /// <param name="model">Object content</param>
        /// <returns></returns>
        public async Task<IResult> Update(TrackPriceDto model)
        {
            var userId = User.Claims.First(t => t.Type == "UserId").Value;
            return await _TrackPriceServices.UpdateAsync(model, userId);
        }
    }
}