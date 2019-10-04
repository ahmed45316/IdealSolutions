using AutoMapper;
using Codes.Entities.Entities;
using Codes.Services.Dto;
using Codes.Services.Interfaces;
using Codes.Services.UnitOfWork;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Tenets.Common.Core;
using Tenets.Common.Enums;
using Tenets.Common.ServicesCommon.Codes.Parameters;

namespace Codes.Services.Services
{
    public class LookupsServices : ILookupsServices
    {
        private readonly IMapper _mapper;
        private readonly IResponseResult _responseResult;
        private readonly IUnitOfWork<InvoiceType> _invoiceType;
        private readonly IUnitOfWork<Car> _car;
        private readonly IUnitOfWork<CarType> _carType;
        private readonly IUnitOfWork<CustomerCategory> _customerCategory;
        private readonly IUnitOfWork<TrackSetting> _trackSetting;
        private readonly IUnitOfWork<TrackPrice> _trackPrice;
        private readonly IUnitOfWork<TaxType> _taxType;
        private readonly IUnitOfWork<Customer> _customer;
        private readonly IUnitOfWork<Rent> _rent;
        private IResult result;
        public LookupsServices(IMapper mapper, IResponseResult responseResult, IUnitOfWork<InvoiceType> invoiceType, IUnitOfWork<Car> car, IUnitOfWork<CarType> carType, IUnitOfWork<CustomerCategory> customerCategory, IUnitOfWork<TrackSetting> trackSetting, IUnitOfWork<TaxType> taxType, IUnitOfWork<Customer> customer, IUnitOfWork<Rent> rent, IUnitOfWork<TrackPrice> trackPrice)
        {
            _mapper = mapper;
            _responseResult = responseResult;
            _invoiceType = invoiceType;
            _car = car;
            _carType = carType;
            _customerCategory = customerCategory;
            _trackSetting = trackSetting;
            _taxType = taxType;
            _customer = customer;
            _rent = rent;
            _trackPrice = trackPrice;
        }
        public async Task<IResult> GetAllLookupsForPolicy()
        {
            try
            {
                var lookups = new LookupsDto();
                var invoiceType = await _invoiceType.Repository.GetAllAsync();
                lookups.InvoiceType = _mapper.Map<IEnumerable<DropdownDto>>(invoiceType);
                var car = await _car.Repository.GetAllAsync();
                lookups.Car = _mapper.Map<IEnumerable<DropdownDto>>(car);
                var carType = await _carType.Repository.GetAllAsync();
                lookups.CarType = _mapper.Map<IEnumerable<DropdownDto>>(carType);
                var customerCategory = await _customerCategory.Repository.GetAllAsync();
                lookups.CustomerCategory = _mapper.Map<IEnumerable<DropdownDto>>(customerCategory);
                var trackSetting = await _trackSetting.Repository.GetAllAsync(disableTracking: false,
                    include: source => source.Include(t => t.FromTrack).Include(t => t.ToTrack));
                lookups.TrackSetting = _mapper.Map<IEnumerable<DropdownDto>>(trackSetting);
                var taxType = await _taxType.Repository.GetAllAsync();
                lookups.TaxType = _mapper.Map<IEnumerable<DropdownDto>>(taxType);
                return _responseResult.PostResult(lookups, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return result;
            }
        }
        public async Task<IResult> GettrackSettingForPolicy(Guid customerId , DateTime policyDate)
        {
            try
            {
                var query = await _trackPrice.Repository.FirstOrDefaultAsync(q => q.CustomerId == customerId && policyDate.Date >= q.FromDate.Value.Date && policyDate.Date <= q.ToDate.Value.Date,include:
                    source=>source.Include(p=>p.TrackPriceDetails));
                var ids = query.TrackPriceDetails.Select(q => q.TrackSettingId).ToList();
                var trackSetting = await _trackSetting.Repository.FindAsync(q=>ids.Contains(q.Id),disableTracking: false,
                    include: source => source.Include(t => t.FromTrack).Include(t => t.ToTrack));

                var result = _mapper.Map<IEnumerable<DropdownDto>>(trackSetting);
               
                return _responseResult.PostResult(result, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return result;
            }
        }
        public async Task<IResult> GetCarTypesForPolicy(Guid customerId, DateTime policyDate,Guid trackSettingId)
        {
            try
            {
                var query = await _trackPrice.Repository.FirstOrDefaultAsync(q => q.CustomerId == customerId && policyDate.Date >= q.FromDate.Value.Date && policyDate.Date <= q.ToDate.Value.Date, include:
                    source => source.Include(p => p.TrackPriceDetails).ThenInclude(c=>c.TrackPriceDetailCarTypes));

                var ids = query.TrackPriceDetails.FirstOrDefault(p => p.TrackSettingId == trackSettingId).TrackPriceDetailCarTypes.Select(q => q.CarTypeId).ToList();

                var carTypes = await _carType.Repository.FindAsync(q => ids.Contains(q.Id), disableTracking: false);

                var result = _mapper.Map<IEnumerable<DropdownDto>>(carTypes);

                return _responseResult.PostResult(result, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
            }
            catch (Exception e)
            {
                result.Message = e.InnerException != null ? e.InnerException.Message : e.Message;
                result = new ResponseResult(null, status: HttpStatusCode.InternalServerError, exception: e, message: result.Message);
                return result;
            }
        }
        public async Task<IResult> GetTypeNameForOpeningBalance(IEnumerable<OpeningBalanceParameters> parameters)
        {
            var nameByTypeDto = new List<NameByTypeDto>();
            // customer
            var customerIds = parameters.Where(q => q.Type == OpeningBalanceType.Customer).Select(q => q.TypeId).ToList();
            var customers = await _customer.Repository.FindAsync(q => customerIds.Contains(q.Id));
            foreach (var customer in customers)
            {
                nameByTypeDto.Add(new NameByTypeDto() { Type = OpeningBalanceType.Customer, NameAr = customer.NameAr, NameEn = customer.NameEn, Id = customer.Id });
            }
            // rent
            var rentIds = parameters.Where(q => q.Type == OpeningBalanceType.Rent).Select(q => q.TypeId).ToList();
            var rents = await _rent.Repository.FindAsync(q => rentIds.Contains(q.Id));
            foreach (var rent in rents)
            {
                nameByTypeDto.Add(new NameByTypeDto() { Type = OpeningBalanceType.Rent, NameAr = rent.NameAr, NameEn = rent.NameEn, Id = rent.Id });
            }
            return _responseResult.PostResult(nameByTypeDto, status: HttpStatusCode.OK, message: HttpStatusCode.OK.ToString());
        }
    }
}
