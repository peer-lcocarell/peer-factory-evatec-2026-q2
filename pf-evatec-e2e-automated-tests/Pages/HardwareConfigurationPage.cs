using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class HardwareConfigurationPage
{
    private readonly IPage _page;

    public HardwareConfigurationPage(IPage page)
    {
        _page = page;
    }

    public async Task ImportBomByBpsAsync(string bpsNumber)
    {
        await _page.GetByRole(AriaRole.Cell, new() { Name = "SPM6" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "All" }).ClickAsync();

        await _page.GetByRole(AriaRole.Row, new() { Name = "Logbook - Role - Active Hardware Change Hardware Component 1:1" })
            .GetByRole(AriaRole.Button, new() { Name = "Change Hardware Component" })
            .ClickAsync();

        await _page.Locator(".modal-footer > div > button:nth-child(3)").ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Import" }).ClickAsync();

        var bpsSearch = _page.GetByPlaceholder("Search BPS #");
        await bpsSearch.FillAsync(bpsNumber);

        await _page.GetByRole(AriaRole.Button, new() { Name = "Advanced BPS Search" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Import BOM" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        await Expect(_page).ToHaveURLAsync(new Regex("Tools", RegexOptions.IgnoreCase));
    }
}
