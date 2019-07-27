using AutoMapper;
using Codes.Entities.Entities;
using Tenets.Common.ServicesCommon.Codes.Interface;

namespace Codes.Services.Profiler
{
    public class AutoMapperConfiguration : Profile
    {
        public AutoMapperConfiguration()
        {
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
            CreateMap<Car, ICarDto>().ReverseMap();
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
            CreateMap<TrackPrice, ITrackPriceDto>().ReverseMap();
        }
    }
}
