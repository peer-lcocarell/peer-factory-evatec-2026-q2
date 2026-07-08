using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class ModuleTypesPage
{
    private readonly IPage _page;

    public ModuleTypesPage(IPage page)
    {
        _page = page;
    }

    public async Task CreateModuleTypeAsync(string moduleName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(moduleName);
        await _page.Locator("#clr-input-3").FillAsync($"Short {DateTime.UtcNow:HHmmss}");
        await _page.Locator("#clr-textarea-0").FillAsync("Module type created by .NET migration utility.");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        await Expect(_page).ToHaveURLAsync(new Regex("Module", RegexOptions.IgnoreCase));
    }
}
