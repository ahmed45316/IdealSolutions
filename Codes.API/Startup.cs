using Codes.Services.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Tenets.Common.Extensions;

namespace Codes.API
{
    /// <summary>
    /// Start Up Class
    /// </summary>
    public class Startup
    {
        /// <inheritdoc />
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        /// <summary>
        /// Property
        /// </summary>
        public IConfiguration Configuration { get; }

        /// <summary>
        /// This method gets called by the runtime. Use this method to add services to the container.
        /// </summary>
        /// <param name="services">Contract for service descriptors</param>
        public void ConfigureServices(IServiceCollection services)
        {
            services.RegisterCommonServices(Configuration);
            services.RegisterServices(Configuration);
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
        }

        /// <summary>
        ///  This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        /// </summary>
        /// <param name="app">Provide mechanisms to configure requests</param>
        /// <param name="env">Provide information about hosting</param>
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.ConfigureApp(env, Configuration);
            if (env.IsDevelopment()) app.UseDeveloperExceptionPage();
            else app.UseHsts();
            app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
