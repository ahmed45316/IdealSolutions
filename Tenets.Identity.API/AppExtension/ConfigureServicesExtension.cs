using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using NetCore.AutoRegisterDi;
using System.Reflection;
using System.Text;
using Tenets.Common.ServicesCommon.Identity.Interface;
using Tenets.Identity.Data.Context;
using Tenets.Identity.Data.SeedData;
using Tenets.Identity.Services.Core;
using Tenets.Identity.Services.Dto;
using Tenets.Identity.Services.Profiler;
using Tenets.Identity.Services.Services;
using Tenets.Identity.Services.UnitOfWork;

namespace Tenets.Identity.API.AppExtension
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
            var connection = _configuration.GetConnectionString("IdentityContext"); 
            services.AddDbContext<IdentityContext>(options => options.UseSqlServer(connection));
            services.AddScoped<DbContext, IdentityContext>();
            services.AddSingleton<IDataInitialize, DataInitialize>();
        }
        private static void Dtos(this IServiceCollection services)
        {
            services.AddSingleton<IUserDto, UserDto>();
            services.AddSingleton<IUserDto, UserDto>();
            services.AddSingleton<IScreenDto, ScreenDto>();
            services.AddSingleton<IRoleDto, RoleDto>();
            services.AddSingleton<IMenuDto, MenuDto>();
            services.AddSingleton<IUserLoginReturn, UserLoginReturn>();
        }
        private static void RegisterCores(this IServiceCollection services)
        {
            services.AddTransient(typeof(IBaseService<,>), typeof(BaseService<,>));
            services.AddTransient(typeof(IServiceBaseParameter<>), typeof(ServiceBaseParameter<>));
            services.AddTransient<ITokenBusiness, TokenBusiness>();
            services.AddTransient<IDecodingValidToken, DecodingValidToken>();
            services.AddSingleton<IDataInitialize, DataInitialize>();
            services.AddTransient(typeof(IUnitOfWork<>), typeof(UnitOfWork<>));
            var servicesToScan = Assembly.GetAssembly(typeof(LoginServices)); //..or whatever assembly you need
            services.RegisterAssemblyPublicNonGenericClasses(servicesToScan)
              .Where(c => c.Name.EndsWith("Services"))
              .AsPublicImplementedInterfaces();
        }
    }
}
