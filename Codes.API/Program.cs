using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;


namespace Codes.API
{
    /// <summary>
    /// Kick Off
    /// </summary>
    public class Program
    {
        /// <summary>
        /// Main
        /// </summary>
        /// <param name="args"></param>
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }
        /// <summary>
        /// Web Host
        /// </summary>
        /// <param name="args"></param>
        /// <returns></returns>
        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
            .UseIISIntegration()
                .UseStartup<Startup>();
    }
}
