using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class BoxesPage
{
    private readonly IPage _page;

    public BoxesPage(IPage page)
    {
        _page = page;
    }

    public async Task CreateBoxFromBpsAsync(string boxName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();
        await _page.GetByText("Select by BPS Number").ClickAsync();
        await _page.GetByText("117713 BPS").ClickAsync();

        await _page.Locator(".btn").First.ClickAsync();
        await _page.Locator("#clr-input-2").FillAsync(boxName);
        await _page.Locator("#clr-combobox-0").FillAsync("m");
        await _page.GetByRole(AriaRole.Option, new() { Name = "3019622 - Sampling_Silex SE_CLN2_17_MSQ contamination tests" }).ClickAsync();

        await _page.Locator("#clr-input-3").FillAsync("123");
        await _page.Locator("#clr-input-4").FillAsync("Created by migration utility.");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        await Expect(_page).ToHaveURLAsync(new Regex("Boxes", RegexOptions.IgnoreCase));
    }

    public async Task CreateBoxWithManualSubstratesAsync(string boxName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();
        await _page.GetByText("Define substrates manually").ClickAsync();
        await _page.Locator(".btn").First.ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(boxName);
        await _page.Locator("#clr-combobox-0").FillAsync("0");
        await _page.GetByRole(AriaRole.Option, new() { Name = "106797 - XXX" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(1).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "AUTOMATION" }).ClickAsync();

        await _page.Locator("#clr-input-4").FillAsync("comment");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(2).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "FOUP" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(3).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "300mm wafer", Exact = true }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Add Substrate to all empty slots" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        await Expect(_page).ToHaveURLAsync(new Regex("Boxes", RegexOptions.IgnoreCase));
    }
}
