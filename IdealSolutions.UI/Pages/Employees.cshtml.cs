using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace IdealSolutions.UI.Pages
{
    public class EmployeesModel : PageModel
    {
        private readonly ILogger<EmployeesModel> _logger;

        public EmployeesModel(ILogger<EmployeesModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {

        }
    }
}
