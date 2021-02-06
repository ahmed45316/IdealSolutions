using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace IdealSolutions.UI.Pages
{
    public class TasksModel : PageModel
    {
        private readonly ILogger<TasksModel> _logger;

        public TasksModel(ILogger<TasksModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}
