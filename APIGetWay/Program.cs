using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace APIGetWay
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
           WebHost.CreateDefaultBuilder(args)
            .ConfigureAppConfiguration((host, config) =>
            {
                config.AddJsonFile("ocelot.json");
            })
            .UseIISIntegration()
            .UseStartup<Startup>();
    }
}
