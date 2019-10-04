using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NetCore.AutoRegisterDi;
using System.Reflection;
using Codes.Data.Context;
using Codes.Services.Core;
using Codes.Services.Profiler;
using Codes.Services.UnitOfWork;
using Codes.Services.Dto;
using Codes.Services.Services;

namespace Codes.API.AppExtension
{
    public static class ConfigureServicesExtension
    {
        public static IServiceCollection RegisterServices(this IServiceCollection services, IConfiguration _configuration)
        {
            services.DatabaseConfig(_configuration);
            services.RegisterCores();
            services.AddAutoMapper(Assembly.GetAssembly(typeof(AutoMapperConfiguration)));
            return services;
        }
        private static void DatabaseConfig(this IServiceCollection services, IConfiguration _configuration)
        {
            var connection = _configuration.GetConnectionString("CodesContext");
            var rowNumberForPagging = bool.Parse(_configuration["RowNumberForPagging"]);
            if (rowNumberForPagging)
            {
                services.AddDbContext<CodesContext>(options => options.UseSqlServer(connection, builder => builder.UseRowNumberForPaging()));
            }
            else
            {
                services.AddDbContext<CodesContext>(options => options.UseSqlServer(connection));
            }

            services.AddScoped<DbContext, CodesContext>();
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
