using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.Collections.Generic;
using System.IO;
using Tenets.Common.Core;
using AutoMapper;
using System.Linq;

namespace Tenets.Common.Extensions
{
    public static class ConfigureServicesCommon
    {
        public static IServiceCollection RegisterCommonServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddCors();
            services.RegisterMainCore();
            services.AddApiDocumentationServices(configuration);
            return services;
        }
        private static void RegisterMainCore(this IServiceCollection services)
        {
            services.AddTransient<IResponseResult, ResponseResult>();
            services.AddTransient<IResult, Result>();
            services.AddTransient<IDataPagging, DataPagging>();
            services.AddTransient<IImageConfig, ImageConfig>();
        }
        private static void AddApiDocumentationServices(this IServiceCollection services,IConfiguration configuration)
        {
            services.AddSwaggerGen(options =>
            {
                string title = configuration["SwaggerConfig:Title"];
                string version = configuration["SwaggerConfig:Version"];
                string docPath = configuration["SwaggerConfig:DocPath"];
                options.SwaggerDoc(version, new Info { Title = title, Version = version });
                options.DescribeAllEnumsAsStrings();
                var filePath = Path.Combine(AppContext.BaseDirectory, docPath);
                options.IncludeXmlComments(filePath);
                var security = new Dictionary<string, IEnumerable<string>> { { "Bearer", Enumerable.Empty<string>() } };
                options.AddSecurityDefinition("Bearer", new ApiKeyScheme
                {
                    Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
                    Name = "Authorization",
                    In = "header",
                    Type = "apiKey"
                });
                options.AddSecurityRequirement(security);

            });
        }
    }
}
