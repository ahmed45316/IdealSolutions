using System.Reflection;
using AutoMapper;
using BackendCore.Common.Abstraction.UnitOfWork;
using BackendCore.Common.Extensions;
using Employee.Data.Context;
using Employee.Data.UnitOfWork;
using Employee.Service.Mapping;
using Employee.Service.Services.Base;
using Employee.Service.Services.Employee;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using NetCore.AutoRegisterDi;
using Newtonsoft.Json;

namespace Employee.Api.Extensions
{
    /// <summary>
    /// Dependency Extensions
    /// </summary>
    public static class ConfigureServiceExtension
    {
        private const string ConnectionStringName = "Default";
        /// <summary>
        /// Register Extensions
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration"></param>
        /// <returns></returns>
        public static IServiceCollection RegisterServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.RegisterDbContext(configuration);
            services.RegisterCores();
            services.RegisterAutoMapper();
            services.RegisterCommonServices(configuration);
            services.AddControllers().AddNewtonsoftJson(x => x.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore);
            return services;
        }

        /// <summary>
        /// Add DbContext
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration"></param>
        private static void RegisterDbContext(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<EmployeeDbContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString(ConnectionStringName));
            });
            services.AddScoped<DbContext, EmployeeDbContext>();
        }


        /// <summary>
        /// register auto-mapper
        /// </summary>
        /// <param name="services"></param>
        private static void RegisterAutoMapper(this IServiceCollection services)
        {
            services.AddAutoMapper(typeof(MappingService));
        }

        /// <summary>
        /// Register Main Core
        /// </summary>
        /// <param name="services"></param>
        private static void RegisterCores(this IServiceCollection services)
        {
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddTransient(typeof(IBaseService<,>), typeof(BaseService<,>));
            services.AddTransient(typeof(IServiceBaseParameter<>), typeof(ServiceBaseParameter<>));
            services.AddTransient(typeof(IUnitOfWork<>), typeof(UnitOfWork<>));
            var servicesToScan = Assembly.GetAssembly(typeof(EmployeeService)); //..or whatever assembly you need
            services.RegisterAssemblyPublicNonGenericClasses(servicesToScan)
                .Where(c => c.Name.EndsWith("Service"))
                .AsPublicImplementedInterfaces();
        }
    }
}
