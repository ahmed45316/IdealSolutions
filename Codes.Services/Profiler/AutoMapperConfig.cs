using AutoMapper;
using Codes.Entities.Entities;
using Codes.Services.Dto;
using Microsoft.AspNetCore.Http;
using System;
using Tenets.Common.ServicesCommon.Base;
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
            CreateMap<DropdownDto, Car>().ReverseMap()
            .ForMember(dest => dest.NameAr, opt => opt.MapFrom(src => src.PlateNumber))
            .ForMember(dest => dest.NameEn, opt => opt.MapFrom(src => src.PlateNumber));
        }
        private void MappCarType()
        {
            CreateMap<CarType, ICarTypeDto>().ReverseMap();
            CreateMap<TrackPriceDetailCarTypeDto, CarType>().ReverseMap()
                .ForMember(dest => dest.CarTypeId, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.CarNameAr, opt => opt.MapFrom(src => src.NameAr))
                .ForMember(dest => dest.CarNameEn, opt => opt.MapFrom(src => src.NameEn))
                .ForMember(dest => dest.Id,opt => opt.Ignore());
            CreateMap<DropdownDto, CarType>().ReverseMap();
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
            CreateMap<IDropdownDto,Customer>().ReverseMap();
        }
        private void MappCustomerCategory()
        {
            CreateMap<CustomerCategory, ICustomerCategoryDto>().ReverseMap();
            CreateMap<DropdownDto, CustomerCategory>().ReverseMap();
        }
        private void MappInvoiceType()
        {
            CreateMap<InvoiceType, IInvoiceTypeDto>().ReverseMap();
            CreateMap<DropdownDto, InvoiceType>().ReverseMap();
        }
        private void MappRent()
        {
            CreateMap<Rent, IRentDto>().ReverseMap();
            CreateMap<IDropdownDto, Rent>().ReverseMap();
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
            CreateMap<DropdownDto, TaxType>().ReverseMap();
        }
        private void MappTrack()
        {
            CreateMap<Track, ITrackDto>().ReverseMap();
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
            CreateMap<Driver, IDriverDto>().ReverseMap();
        }
        private void MappTrackSetting()
        {
            CreateMap<ITrackSettingDto, TrackSetting>().ReverseMap().ForMember(dest => dest.NameAr,
                opt => opt.MapFrom(src => (src.FromTrack == null || src.ToTrack == null) ? "" : src.FromTrack.NameAr + "-" + src.ToTrack.NameAr));
            CreateMap<ITrackSettingDropDownDto, TrackSetting>().ReverseMap()
                .ForMember(dest => dest.NameAr,
                opt => opt.MapFrom(src => (src.FromTrack == null || src.ToTrack == null) ? "" : src.FromTrack.NameAr + "-" + src.ToTrack.NameAr));
            CreateMap<DropdownDto, TrackSetting>().ReverseMap()
                .ForMember(dest => dest.NameAr,
                opt => opt.MapFrom(src => (src.FromTrack == null || src.ToTrack == null) ? "" : src.FromTrack.NameAr + "-" + src.ToTrack.NameAr));
        }
    }
}
