using AutoMapper;
using Microsoft.AspNetCore.Http;
using System;
using System.Linq;
using Tenets.Common.Enums;
using Tenets.Common.ServicesCommon.Transaction.Interface;
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
            CreateMap<PolicyDetail, PolicyDetailDto>().ReverseMap();
            CreateMap<CollectReceiptPolicyDto, PolicyDetail>().ReverseMap();

            CreateMap<Policy, PolicyDto>().ReverseMap()
                .ForMember(dest => dest.CreateUserId, opt => opt.MapFrom(src => _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.CreateDate, opt => opt.MapFrom(src => DateTime.Now))
                .ForMember(dest => dest.ModifyUserId, opt => opt.MapFrom(src => src.Id == null ? null : _httpContextAccessor.HttpContext.User.FindFirst(t => t.Type == "UserId").Value))
                .ForMember(dest => dest.ModifyDate, opt => opt.MapFrom(src => src.Id == null ? (DateTime?)null : DateTime.Now));
        }
        private void MappOpeningBalance()
        {
            CreateMap<IOpeningBalanceDto, OpeningBalance>().ReverseMap()
                .ForMember(dest => dest.DebitCridetNameEn, opt => opt.MapFrom(src => src.DebitCridet.ToString()))
                .ForMember(dest => dest.DebitCridetNameEn, opt => opt.MapFrom(src => src.DebitCridet.ToString() == "Debit" ? "مدين" : "دائن"));
        }
        private void MappClaimCustomer()
        {
            CreateMap<ClaimCustomer, IClaimCustomerDto>().ReverseMap();
        }
        private void MappCollectReceipt()
        {
            CreateMap<CollectReceipt, ICollectReceiptDto>().ReverseMap();
        }
    }
}
