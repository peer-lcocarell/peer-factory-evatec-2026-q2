using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class CollectionsPage
{
    private readonly IPage _page;

    public CollectionsPage(IPage page)
    {
        _page = page;
    }

    public async Task CreateCollectionWithSubstratesAsync(string collectionName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(collectionName);

        await _page.Locator("#clr-combobox-1-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).First.ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Lev Cocarell (LC)" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.Locator("#clr-combobox-0-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "AUTOMATED" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.Locator("#clr-textarea-0").FillAsync("Collection created by Playwright .NET migration utility.");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Add" }).ClickAsync();
        await _page.Locator("td:nth-child(2) > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label").First.ClickAsync();
        await _page.Locator("tr:nth-child(3) > .row-selector-col > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label").First.ClickAsync();
        await _page.GetByTitle("Add", new() { Exact = true }).ClickAsync();

        await _page.GetByTitle("Close").ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).First.ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        await Expect(_page).ToHaveURLAsync(new Regex("Collections", RegexOptions.IgnoreCase));
    }
}
