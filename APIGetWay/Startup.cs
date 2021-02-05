using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Ocelot.DependencyInjection;
using Ocelot.Middleware;

namespace APIGetWay
{
    public class Startup
    {
        private const string AllowLocalhostOriginPolicy = "_allowLocalhostOriginPolicy";

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
                options.AddPolicy(AllowLocalhostOriginPolicy,
                builder =>
                {
                    builder.WithOrigins(origin).AllowAnyHeader().AllowAnyMethod();
                });
            });
            services.AddControllers();
            services.AddOcelot(Configuration);
            services.AddSwaggerForOcelot(Configuration);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public async void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseCors(AllowLocalhostOriginPolicy);
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseStaticFiles();
            await app.UseSwaggerForOcelotUI(Configuration, opt =>
            {
                opt.DownstreamSwaggerEndPointBasePath = Configuration["DownstreamSwaggerEndPointBasePath"];
                opt.PathToSwaggerGenerator = Configuration["PathToSwaggerGenerator"];
            })
            .UseOcelot();
        }
    }
}
