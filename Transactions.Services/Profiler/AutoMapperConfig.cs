using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using System.Linq;
using Tenets.Common.Enums;
using Transactions.Entities.Entities;
using Transactions.Services.Dto;
using Transactions.Services.ReportsDto;

namespace Transactions.Services.Profiler
{
    public class AutoMapperConfiguration : Profile
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public AutoMapperConfiguration()
        {
            _httpContextAccessor = new HttpContextAccessor();
            MapPolicy();
            MapOpeningBalance();
            MapClaimCustomer();
            MapCollectReceipt();
            MapCustomer();
        }

        private void MapPolicy()
        {
            CreateMap<PolicyDto,Policy>().ReverseMap()
                .ForMember(dest => dest.Migrated, opt => opt.MapFrom(src => !(src.THeadId == null || src.THeadId == 0)))
                .ForMember(dest => dest.CustomerNameAr, opt => opt.MapFrom(src => src.Customer.NameAr));
            CreateMap<CollectReceiptPolicyDto, Policy>().ReverseMap();
            CreateMap<PolicyViewModel, Policy>().ReverseMap()
                .ForMember(dest => dest.TelNumber, opt => opt.MapFrom(src => src.DriverPhone));
        }
        private void MapOpeningBalance()
        {
            CreateMap<OpeningBalanceDto, OpeningBalance>().ReverseMap()
                .ForMember(dest => dest.DebitCridetNameEn, opt => opt.MapFrom(src => src.DebitCridet.ToString()))
                .ForMember(dest => dest.DebitCridetNameEn, opt => opt.MapFrom(src => src.DebitCridet.ToString() == "Debit" ? "مدين" : "دائن"));
        }
        private void MapClaimCustomer()
        {
            CreateMap<ClaimCustomer, ClaimCustomerDto>().ReverseMap();
        }
        private void MapCollectReceipt()
        {
            CreateMap<CollectReceipt, CollectReceiptDto>().ReverseMap();
        }
        private void MapCustomer()
        {
            CreateMap<Customer, CustomerDto>().ReverseMap();
        }
    }
}
