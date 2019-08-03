using AutoMapper;
using Codes.Entities.Entities;
using Codes.Services.Dto;
using Microsoft.AspNetCore.Http;
using System;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Profiler
{
    public class AutoMapperConfiguration : Profile
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public AutoMapperConfiguration()
        {
            _httpContextAccessor = new HttpContextAccessor();
            MappCompanies();
            MappBranch();
            MappCar();
            MappCarType();
            MappCity();
            MappCountry();
            MappCustomer();
            MappCustomerCategory();
            MappInvoiceType();
            MappRent();
            MappRepresentative();
            MappTaxCategory();
            MappTaxType();
            MappTrack();
            MappTrackPrice();
            MappDriver();
            MappTrackSetting();
            MappTrackPriceDetail();
            MappTrackPriceDetailCarType();
        }

        private void MappCompanies()
        {
            CreateMap<Company, ICompanyDto>().ReverseMap();
        }
        private void MappBranch()
        {
            CreateMap<Branch, IBranchDto>().ReverseMap();
        }
        private void MappCar()
        {
            CreateMap<Car, ICarDto>()
                .ForMember(dest => dest.ModelName, opt => opt.MapFrom(src => src.Model)).ReverseMap();
        }
        private void MappCarType()
        {
            CreateMap<CarType, ICarTypeDto>().ReverseMap();
        }
        private void MappCity()
        {
            CreateMap<City, ICityDto>().ReverseMap();
        }
        private void MappCountry()
        {
            CreateMap<Country, ICountryDto>().ReverseMap();
        }
        private void MappCustomer()
        {
            CreateMap<Customer, ICustomerDto>().ReverseMap();
        }
        private void MappCustomerCategory()
        {
            CreateMap<CustomerCategory, ICustomerCategoryDto>().ReverseMap();
        }
        private void MappInvoiceType()
        {
            CreateMap<InvoiceType, IInvoiceTypeDto>().ReverseMap();
        }
        private void MappRent()
        {
            CreateMap<Rent, IRentDto>().ReverseMap();
        }
        private void MappRepresentative()
        {
            CreateMap<Representative, IRepresentativeDto>().ReverseMap();
        }
        private void MappTaxCategory()
        {
            CreateMap<TaxCategory, ITaxCategoryDto>().ReverseMap();
        }
        private void MappTaxType()
        {
            CreateMap<TaxType, ITaxTypeDto>().ReverseMap();
        }
        private void MappTrack()
        {
            CreateMap<Track, ITrackDto>().ReverseMap();
        }
        private void MappTrackPrice()
        {
            CreateMap<TrackPrice, TrackPriceDto>().ReverseMap();
        }
        private void MappTrackPriceDetail()
        {
            CreateMap<TrackPriceDetail, TrackPriceDetailDto>().ReverseMap()
                .ForMember(dest => dest.CreateUserId, opt => opt.MapFrom(src => _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => DateTime.Now))
                .ForMember(dest => dest.ModifyUserId, opt => opt.MapFrom(src =>src.Id==null?null: _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.ModifyDate, opt => opt.MapFrom(src => src.Id == null ? (DateTime?)null : DateTime.Now));
        }
        private void MappTrackPriceDetailCarType()
        {
            CreateMap<TrackPriceDetailCarType,TrackPriceDetailCarTypeDto>().ReverseMap()
                .ForMember(dest => dest.CreateUserId, opt => opt.MapFrom(src => _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => DateTime.Now))
                .ForMember(dest => dest.ModifyUserId, opt => opt.MapFrom(src => src.Id == null ? null : _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.ModifyDate, opt => opt.MapFrom(src => src.Id == null ? (DateTime?)null : DateTime.Now));
        }
        private void MappDriver()
        {
            CreateMap<Driver, IDriverDto>().ReverseMap();
        }
        private void MappTrackSetting()
        {
            CreateMap<ITrackSettingDto, TrackSetting>().ReverseMap().ForMember(dest => dest.NameAr,
                opt => opt.MapFrom(src => (src.FromTrack == null || src.ToTrack == null) ? "" : src.FromTrack.NameAr + "-" + src.ToTrack.NameAr));
            CreateMap<ITrackSettingDropDownDto, TrackSetting>().ReverseMap()
                .ForMember(dest => dest.NameAr,
                opt => opt.MapFrom(src => (src.FromTrack == null || src.ToTrack == null) ? "" : src.FromTrack.NameAr + "-" + src.ToTrack.NameAr));
        }
    }
}
