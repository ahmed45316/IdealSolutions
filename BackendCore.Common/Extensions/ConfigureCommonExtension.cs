using System;
using System.IO;
using BackendCore.Common.Core;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;

namespace BackendCore.Common.Extensions
{
    public static class ConfigureCommonExtension
    {
        public static IServiceCollection RegisterCommonServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddCors();
            services.RegisterMainCore(configuration);
            services.AddApiDocumentationServices(configuration);
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            return services;
        }

        private static void RegisterMainCore(this IServiceCollection services , IConfiguration configuration)
        {
            services.AddTransient<IResponseResult, ResponseResult>();
            services.AddTransient<IResult, Result>();
        }

        private static void AddApiDocumentationServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSwaggerGen(options =>
            {
                string title = configuration["SwaggerConfig:Title"];
                string version = configuration["SwaggerConfig:Version"];
                string docPath = configuration["SwaggerConfig:DocPath"];
                options.SwaggerDoc(version, new OpenApiInfo { Title = title, Version = version });
                var filePath = Path.Combine(AppContext.BaseDirectory, docPath);
                options.IncludeXmlComments(filePath);
                var security = new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            }
                        },
                        new string[] { }

                    }
                };
                options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "JWT Authorization header using the Bearer scheme."
                });
                options.AddSecurityRequirement(security);

            });
            services.AddSwaggerGenNewtonsoftSupport();
        }
    }
}
