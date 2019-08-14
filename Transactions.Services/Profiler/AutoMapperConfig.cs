using AutoMapper;
using Transactions.Entities.Entites;
using Transactions.Services.Dto;

namespace Transactions.Services.Profiler
{
    public class AutoMapperConfiguration : Profile
    {
        public AutoMapperConfiguration()
        {
            MappPolicy();
        }

        private void MappPolicy()
        {
            CreateMap<PolicyDetail, PolicyDetailDto > ().ReverseMap();
            CreateMap<Policy,PolicyDto>().ReverseMap();
        }      
    }
}
