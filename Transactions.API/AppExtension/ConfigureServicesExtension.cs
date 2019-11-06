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
using Transactions.Services.Dto;
using CodeShellCore.Reporting.Services;
using CodeShellCore.Services;

namespace Transactions.API.AppExtension
{
    /// <inheritdoc />
    public static class ConfigureServicesExtension
    {
        /// <inheritdoc />
        public static IServiceCollection RegisterServices(this IServiceCollection services, IConfiguration _configuration)
        {
            services.DatabaseConfig(_configuration);
            services.RegisterCores();
            services.AddAutoMapper(Assembly.GetAssembly(typeof(AutoMapperConfiguration)));
            services.AddTransient<RdlcDataSetGenerator,RdlcDataSetGenerator>();
            services.AddTransient<WriterService, WriterService>();
            return services;
        }
       private static void DatabaseConfig(this IServiceCollection services,IConfiguration _configuration)
        {
            var connection = _configuration.GetConnectionString("TransactionContext");
            var rowNumberForPagging = bool.Parse(_configuration["RowNumberForPagging"]);
            if (rowNumberForPagging)
            {
                services.AddDbContext<TransactionContext>(options => options.UseSqlServer(connection, builder => builder.UseRowNumberForPaging()));
            }
            else
            {
                services.AddDbContext<TransactionContext>(options => options.UseSqlServer(connection));
            }
            services.AddScoped<DbContext, TransactionContext>();
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
