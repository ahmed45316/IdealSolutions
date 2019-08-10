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
            CreateMap<Policy,PolicyDto>().ReverseMap();
        }      
    }
}
