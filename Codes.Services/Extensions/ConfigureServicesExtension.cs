using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NetCore.AutoRegisterDi;
using System.Reflection;
using Tenets.Common.ServicesCommon.Identity.Interface;
using Codes.Data.Context;
using Codes.Services.Core;
using Codes.Services.Profiler;
using Codes.Services.UnitOfWork;
using Tenets.Common.ServicesCommon.Codes.Interface;
using Codes.Services.Dto;
using Codes.Services.Services;

namespace Codes.Services.Extensions
{
    public static class ConfigureServicesExtension
    {
        public static IServiceCollection RegisterServices(this IServiceCollection services, IConfiguration _configuration)
        {
            services.DatabaseConfig(_configuration);
            services.Dtos();
            services.RegisterCores();
            services.AddAutoMapper(Assembly.GetAssembly(typeof(AutoMapperConfiguration)));
            return services;
        }
       private static void DatabaseConfig(this IServiceCollection services,IConfiguration _configuration)
        {
            var connection = _configuration.GetConnectionString("CodesContext"); 
            services.AddDbContext<CodesContext>(options => options.UseSqlServer(connection));
            services.AddScoped<DbContext, CodesContext>();
        }
        private static void Dtos(this IServiceCollection services)
        {
            services.AddScoped<ICompanyDto, CompanyDto>();
            services.AddScoped<IBranchDto, BranchDto>();
            services.AddScoped<ICarDto, CarDto>();
            services.AddScoped<ICarTypeDto, CarTypeDto>();
            services.AddScoped<ICityDto, CityDto>();
            services.AddScoped<ICountryDto, CountryDto>();
            services.AddScoped<ICustomerDto, CustomerDto>();
            services.AddScoped<ICustomerCategoryDto, CustomerCategoryDto>();
            services.AddScoped<IInvoiceTypeDto, InvoiceTypeDto>();
            services.AddScoped<IRentDto, RentDto>();
            services.AddScoped<IRepresentativeDto, RepresentativeDto>();
            services.AddScoped<ITaxCategoryDto, TaxCategoryDto>();
            services.AddScoped<ITaxTypeDto, TaxTypeDto>();
            services.AddScoped<ITrackDto, TrackDto>();
            services.AddScoped<ITrackPriceDto, TrackPriceDto>();
            services.AddScoped<IDriverDto, DriverDto>();
            services.AddScoped<ITrackSettingDto, TrackSettingDto>();
        }
        private static void RegisterCores(this IServiceCollection services)
        {
            services.AddTransient(typeof(IBaseService<,>), typeof(BaseService<,>));
            services.AddTransient(typeof(IServiceBaseParameter<>), typeof(ServiceBaseParameter<>));
            services.AddTransient(typeof(IUnitOfWork<>), typeof(UnitOfWork<>));
            var servicesToScan = Assembly.GetAssembly(typeof(CompanyServices)); //..or whatever assembly you need
            services.RegisterAssemblyPublicNonGenericClasses(servicesToScan)
              .Where(c => c.Name.EndsWith("Services"))
              .AsPublicImplementedInterfaces();
        }
    }
}
