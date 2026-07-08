using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class ProjectsPage
{
    private readonly IPage _page;

    public ProjectsPage(IPage page)
    {
        _page = page;
    }

    public async Task CreatePrivateProjectAsync(string projectName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(projectName);
        await _page.Locator("#clr-combobox-1-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Automated" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.Locator("#clr-combobox-0").FillAsync("sam");
        await _page.GetByRole(AriaRole.Option, new() { Name = "3044445 - Sampling Olympus SiO2, ITO 300mm" }).ClickAsync();

        await _page.Locator("#clr-textarea-0").FillAsync($"Created by automated test {DateTime.UtcNow:O}");

        await _page.Locator("#clr-combobox-2-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Lev Cocarell (LC)" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        await Expect(_page).ToHaveURLAsync(new Regex("Projects", RegexOptions.IgnoreCase));
    }
}
