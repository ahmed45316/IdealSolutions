#pragma checksum "D:\WorkSpace\tasks\IdealSolutions\IdealSolutions.UI\Pages\Employees.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "6ea95357e0933e609d4e57e4d0175951d1e46812"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(IdealSolutions.UI.Pages.Pages_Employees), @"mvc.1.0.razor-page", @"/Pages/Employees.cshtml")]
namespace IdealSolutions.UI.Pages
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\WorkSpace\tasks\IdealSolutions\IdealSolutions.UI\Pages\_ViewImports.cshtml"
using IdealSolutions.UI;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6ea95357e0933e609d4e57e4d0175951d1e46812", @"/Pages/Employees.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"36512cfdddd3d5360f6173809d7be6b8c846d6c7", @"/Pages/_ViewImports.cshtml")]
    public class Pages_Employees : global::Microsoft.AspNetCore.Mvc.RazorPages.Page
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/JS/Employees.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("id", new global::Microsoft.AspNetCore.Html.HtmlString("popupForm"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("container-fluid"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 3 "D:\WorkSpace\tasks\IdealSolutions\IdealSolutions.UI\Pages\Employees.cshtml"
  
    ViewData["Title"] = "Employees";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"<style>
    .modal-backdrop.show {
        z-index: -1 !important
    }
</style>
<div class=""container-fluid page__container"">
    <h1 class=""h2"">Employees</h1>
    <hr />
    <div class=""portlet light bordered"">
        <div class=""portlet-title"">
            <div class=""actions"">
                <a onclick=""cleartxt();"" style=""cursor: pointer"" data-toggle=""modal"" data-target=""#addeditmodel"" title=""Add New"">
                    <i class=""fas fa-user-plus fa-3x""></i>
                </a>
            </div>
        </div>
        <br />

        <div id=""tableArea"" class=""portlet-body"">

            <table class=""display"" style=""width:100%"" id=""dataGridView"">
                <thead>
                    <tr>
                        <th class=""all"" style=""width: 20px"">Index</th>
                        <th class=""all"">First name</th>
                        <th class=""all"">Last name</th>
                        <th>Job title</th>
                        <th>Email</th>
                ");
            WriteLiteral(@"        <th>Salary</th>
                        <th>Birth date</th>
                        <th class=""all"" style=""width: 20px""></th>
                        <th class=""all"" style=""width: 20px""></th>
                    </tr>
                </thead>

            </table>

        </div>
    </div>

</div>
");
            DefineSection("Scripts", async() => {
                WriteLiteral("\r\n    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "6ea95357e0933e609d4e57e4d0175951d1e468125977", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n");
            }
            );
            WriteLiteral(@"


<!--Modal-->
<div class=""modal"" data-backdrop=""static"" data-keyboard=""false"" id=""addeditmodel"" tabindex=""-1"" role=""dialog"">
    <div class=""modal-dialog"" role=""document"">
        <div class=""modal-content"">
            <div class=""modal-header"">
                <h5 class=""modal-title"">Employees</h5>
                <button type=""button"" class=""close"" data-dismiss=""modal"" aria-label=""Close"">
                    <span aria-hidden=""true"">&times;</span>
                </button>
            </div>
            ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "6ea95357e0933e609d4e57e4d0175951d1e468127690", async() => {
                WriteLiteral(@"
                <input type=""hidden"" id=""hiddenId"" />
                <div class=""modal-body"">
                    <div class=""form-group"">
                        <label class=""control-label"">First name</label>
                        <input class=""form-control"" name=""firstName"" onchange=""onChange()"" type=""text"" id=""firstname"" required />
                    </div>
                    <div class=""form-group"">
                        <label class=""control-label"">Last name</label>
                        <input class=""form-control"" name=""lastName"" onchange=""onChange()"" type=""text"" id=""lastname"" required />
                    </div>
                    <div class=""form-group"">
                        <label class=""control-label"">Job title</label>
                        <input class=""form-control"" name=""jobTitle"" onchange=""onChange()"" type=""text"" id=""jobtitle"" required />
                    </div>
                    <div class=""form-group"">
                        <label class=""control-label");
                WriteLiteral(@""">Email</label>
                        <input class=""form-control"" name=""email"" onchange=""onChange()"" type=""email"" id=""email"" required />
                    </div>
                    <div class=""form-group"">
                        <label class=""control-label"">Salary</label>
                        <input class=""form-control"" name=""salary"" type=""number"" min=""0"" value=""0"" id=""salary"" />
                    </div>
                    <div class=""form-group"">
                        <label class=""control-label"">Birth Date</label>
                        <input class=""form-control"" name=""birthDate"" type=""date"" id=""birthdate"" />
                    </div>
                </div>
                <div class=""modal-footer"">
                    <button type=""submit"" id=""form-submit"" class=""btn btn-primary"">Save changes</button>
                    <button type=""button"" class=""btn btn-secondary"" data-dismiss=""modal"">Close</button>
                </div>
            ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n        </div>\r\n    </div>\r\n</div>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<EmployeesModel> Html { get; private set; }
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<EmployeesModel> ViewData => (global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<EmployeesModel>)PageContext?.ViewData;
        public EmployeesModel Model => ViewData.Model;
    }
}
#pragma warning restore 1591
