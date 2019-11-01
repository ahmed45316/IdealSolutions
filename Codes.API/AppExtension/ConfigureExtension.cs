using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace Codes.API.AppExtension
{
    /// <inheritdoc />
    public static class ConfigureExtension
    {
        /// <inheritdoc />
        public static IApplicationBuilder Configure(this IApplicationBuilder app, IHostingEnvironment env,IConfiguration configuration)
        {
            app.CorsConfig();
            app.UseAuthentication();
            app.SwaggerConfig(configuration);
            return app;
        }
        private static void CorsConfig(this IApplicationBuilder app)
        {
            app.UseCors(builder => builder
               .AllowAnyOrigin()
               .AllowAnyMethod()
               .AllowAnyHeader()
               .AllowCredentials());
        }
        private static void SwaggerConfig(this IApplicationBuilder app, IConfiguration configuration)
        {
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                string endPoint = configuration["SwaggerConfig:EndPoint"];
                string title = configuration["SwaggerConfig:Title"];
                c.SwaggerEndpoint(endPoint, title);
                c.DocumentTitle = $"{title} Documentation";
                c.DocExpansion(DocExpansion.None);
            });
        }
    }
}
