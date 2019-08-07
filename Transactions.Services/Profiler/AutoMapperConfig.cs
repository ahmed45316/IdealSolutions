using AutoMapper;

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
            //CreateMap<Company, ICompanyDto>().ReverseMap();
        }      
    }
}
