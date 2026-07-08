using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class ToolTypesPage
{
    private readonly IPage _page;

    public ToolTypesPage(IPage page)
    {
        _page = page;
    }

    public async Task CreateToolTypeAsync(string toolTypeName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(toolTypeName);
        await _page.Locator("#clr-textarea-0").FillAsync("Tool type created by .NET migration utility.");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).First.ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Module_Type_C.R8.0_QA3_230130" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Add Module" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        await Expect(_page).ToHaveURLAsync(new Regex("Tool", RegexOptions.IgnoreCase));
    }
}
