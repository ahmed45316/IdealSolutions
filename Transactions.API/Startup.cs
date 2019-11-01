using CodeShellCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Tenets.Common.Extensions;
using Transactions.API.AppExtension;

namespace Transactions.API
{
    /// <summary>
    /// Start Up Class
    /// </summary>
    public class Startup
    {
        /// <inheritdoc />
        public TransactionShell _transactionShell { get; set; }
        /// <inheritdoc />
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            _transactionShell = new TransactionShell(configuration);
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
            _transactionShell.RegisterServices(services);
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
            
            app.Configure(env, Configuration);
            _transactionShell.ConfigureHttp(app, env);
            if (env.IsDevelopment()) app.UseDeveloperExceptionPage();
            else app.UseHsts();
            app.UseHttpsRedirection();
            app.UseMvc();
            
            Shell.Start(_transactionShell);
        }
    }
}
