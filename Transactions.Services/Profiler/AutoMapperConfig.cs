using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using System.Linq;
using Tenets.Common.Enums;
using Transactions.Entities.Entites;
using Transactions.Services.Dto;

namespace Transactions.Services.Profiler
{
    public class AutoMapperConfiguration : Profile
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public AutoMapperConfiguration()
        {
            _httpContextAccessor = new HttpContextAccessor();
            MappPolicy();
            MappOpeningBalance();
            MappClaimCustomer();
            MappCollectReceipt();
        }

        private void MappPolicy()
        {
            CreateMap<Policy, PolicyDto>().ReverseMap();
            CreateMap<CollectReceiptPolicyDto, Policy>().ReverseMap();
        }
        private void MappOpeningBalance()
        {
            CreateMap<OpeningBalanceDto, OpeningBalance>().ReverseMap()
                .ForMember(dest => dest.DebitCridetNameEn, opt => opt.MapFrom(src => src.DebitCridet.ToString()))
                .ForMember(dest => dest.DebitCridetNameEn, opt => opt.MapFrom(src => src.DebitCridet.ToString() == "Debit" ? "مدين" : "دائن"));
        }
        private void MappClaimCustomer()
        {
            CreateMap<ClaimCustomer, ClaimCustomerDto>().ReverseMap();
        }
        private void MappCollectReceipt()
        {
            CreateMap<CollectReceipt, CollectReceiptDto>().ReverseMap();
        }
    }
}
