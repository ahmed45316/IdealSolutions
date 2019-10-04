using AutoMapper;
using Codes.Entities.Entities;
using Codes.Services.Dto;
using Microsoft.AspNetCore.Http;
using System;

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
            CreateMap<Company, CompanyDto>().ReverseMap();
        }
        private void MappBranch()
        {
            CreateMap<Branch, BranchDto>().ReverseMap();
        }
        private void MappCar()
        {
            CreateMap<Car, CarDto>()
                .ForMember(dest => dest.ModelName, opt => opt.MapFrom(src => src.Model)).ReverseMap();
            CreateMap<DropdownDto, Car>().ReverseMap()
            .ForMember(dest => dest.NameAr, opt => opt.MapFrom(src => src.PlateNumber))
            .ForMember(dest => dest.NameEn, opt => opt.MapFrom(src => src.PlateNumber));
        }
        private void MappCarType()
        {
            CreateMap<CarType, CarTypeDto>().ReverseMap();
            CreateMap<TrackPriceDetailCarTypeDto, CarType>().ReverseMap()
                .ForMember(dest => dest.CarTypeId, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.CarNameAr, opt => opt.MapFrom(src => src.NameAr))
                .ForMember(dest => dest.CarNameEn, opt => opt.MapFrom(src => src.NameEn))
                .ForMember(dest => dest.Id,opt => opt.Ignore());
            CreateMap<DropdownDto, CarType>().ReverseMap();
        }
        private void MappCity()
        {
            CreateMap<City, CityDto>().ReverseMap();
        }
        private void MappCountry()
        {
            CreateMap<Country, CountryDto>().ReverseMap();
        }
        private void MappCustomer()
        {
            CreateMap<Customer, CustomerDto>().ReverseMap();
            CreateMap<DropdownDto,Customer>().ReverseMap();
        }
        private void MappCustomerCategory()
        {
            CreateMap<CustomerCategory, CustomerCategoryDto>().ReverseMap();
            CreateMap<DropdownDto, CustomerCategory>().ReverseMap();
        }
        private void MappInvoiceType()
        {
            CreateMap<InvoiceType, InvoiceTypeDto>().ReverseMap();
            CreateMap<DropdownDto, InvoiceType>().ReverseMap();
        }
        private void MappRent()
        {
            CreateMap<Rent, RentDto>().ReverseMap();
            CreateMap<DropdownDto, Rent>().ReverseMap();
        }
        private void MappRepresentative()
        {
            CreateMap<Representative, RepresentativeDto>().ReverseMap();
        }
        private void MappTaxCategory()
        {
            CreateMap<TaxCategory, TaxCategoryDto>().ReverseMap();
        }
        private void MappTaxType()
        {
            CreateMap<TaxType, TaxTypeDto>().ReverseMap();
            CreateMap<DropdownDto, TaxType>().ReverseMap();
        }
        private void MappTrack()
        {
            CreateMap<Track, TrackDto>().ReverseMap();
        }
        private void MappTrackPrice()
        {
            CreateMap<TrackPriceDto,TrackPrice>().ReverseMap()
                 .ForMember(dest => dest.CustomerNameAr, opt => opt.MapFrom(src =>src.Customer.NameAr))
                 .ForMember(dest => dest.CustomerNameEn, opt => opt.MapFrom(src => src.Customer.NameEn));
        }
        private void MappTrackPriceDetail()
        {
            CreateMap<TrackPriceDetailDto,TrackPriceDetail>()
                .ForMember(dest => dest.CreateUserId, opt => opt.MapFrom(src => _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => DateTime.Now))
                .ForMember(dest => dest.ModifyUserId, opt => opt.MapFrom(src =>src.Id==null?null: _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.ModifyDate, opt => opt.MapFrom(src => src.Id == null ? (DateTime?)null : DateTime.Now));

            CreateMap<TrackPriceDetail, TrackPriceDetailDto>()
                .ForMember(dest => dest.TrackSettingNameAr, opt => opt.MapFrom(src => src.TrackSetting.FromTrack.NameAr+'-'+src.TrackSetting.ToTrack.NameAr))
                .ForMember(dest => dest.TrackSettingNameEn, opt => opt.MapFrom(src => src.TrackSetting.FromTrack.NameEn + '-' + src.TrackSetting.ToTrack.NameEn));
        }
        private void MappTrackPriceDetailCarType()
        {
            CreateMap<TrackPriceDetailCarTypeDto, TrackPriceDetailCarType>()
                .ForMember(dest => dest.CreateUserId, opt => opt.MapFrom(src => _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => DateTime.Now))
                .ForMember(dest => dest.ModifyUserId, opt => opt.MapFrom(src => src.Id == null ? null : _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.ModifyDate, opt => opt.MapFrom(src => src.Id == null ? (DateTime?)null : DateTime.Now));

            CreateMap<TrackPriceDetailCarType, TrackPriceDetailCarTypeDto>()
                .ForMember(dest => dest.CarNameAr, opt => opt.MapFrom(src => src.CarType.NameAr))
                .ForMember(dest => dest.CarNameEn, opt => opt.MapFrom(src => src.CarType.NameEn));
        }
        private void MappDriver()
        {
            CreateMap<Driver, DriverDto>().ReverseMap();
            CreateMap<DropdownDto, Driver>().ReverseMap();
        }
        private void MappTrackSetting()
        {
            CreateMap<TrackSettingDto, TrackSetting>().ReverseMap().ForMember(dest => dest.NameAr,
                opt => opt.MapFrom(src => (src.FromTrack == null || src.ToTrack == null) ? "" : src.FromTrack.NameAr + "-" + src.ToTrack.NameAr));
            CreateMap<DropdownDto, TrackSetting>().ReverseMap()
                .ForMember(dest => dest.NameAr,
                opt => opt.MapFrom(src => (src.FromTrack == null || src.ToTrack == null) ? "" : src.FromTrack.NameAr + "-" + src.ToTrack.NameAr));
        }
    }
}
