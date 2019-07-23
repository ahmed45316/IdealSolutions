using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;

namespace APIGetWay
{
    public class Startup
    {
        private const string allowLocalhostOriginPolicy = "_allowLocalhostOriginPolicy";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            string origin = Configuration["OriginUrl"];
            services.AddCors(options =>
            {
                options.AddPolicy(allowLocalhostOriginPolicy,
                builder =>
                {
                    builder.WithOrigins(origin).AllowAnyHeader().AllowAnyMethod();
                });
            });
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
            services.AddOcelot(Configuration);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public async void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment()) app.UseDeveloperExceptionPage(); 
            else  app.UseHsts(); 
            app.UseHttpsRedirection();
            app.UseMvc();
            await app.UseOcelot();
        }
    }
}
