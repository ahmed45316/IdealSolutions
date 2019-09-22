using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NetCore.AutoRegisterDi;
using System.Reflection;
using Transactions.Data.Context;
using Transactions.Services.Core;
using Transactions.Services.Profiler;
using Transactions.Services.UnitOfWork;
using Transactions.Services.Services;
using Tenets.Common.ServicesCommon.Transaction.Interface;
using Transactions.Services.Dto;

namespace Transactions.API.AppExtension
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
            var connection = _configuration.GetConnectionString("TransactionContext"); 
            services.AddDbContext<TransactionContext>(options => options.UseSqlServer(connection));
            services.AddScoped<DbContext, TransactionContext>();
        }
        private static void Dtos(this IServiceCollection services)
        {
            services.AddScoped<IPolicyDto, PolicyDto>();
            services.AddScoped<IOpeningBalanceDto, OpeningBalanceDto>();
            services.AddScoped<IClaimCustomerDto, ClaimCustomerDto>();
            services.AddScoped<ICollectReceiptDto, CollectReceiptDto>();
        }
        private static void RegisterCores(this IServiceCollection services)
        {
            services.AddTransient(typeof(IBaseService<,>), typeof(BaseService<,>));
            services.AddTransient(typeof(IServiceBaseParameter<>), typeof(ServiceBaseParameter<>));
            services.AddTransient(typeof(IUnitOfWork<>), typeof(UnitOfWork<>));
            var servicesToScan = Assembly.GetAssembly(typeof(PolicyServices));
            services.RegisterAssemblyPublicNonGenericClasses(servicesToScan)
              .Where(c => c.Name.EndsWith("Services"))
              .AsPublicImplementedInterfaces();
        }
    }
}
