using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class ToolsPage
{
    private readonly IPage _page;

    public ToolsPage(IPage page)
    {
        _page = page;
    }

    public async Task OpenToolByNameAsync(string toolName)
    {
        var link = _page.GetByRole(AriaRole.Link, new() { Name = toolName }).First;
        await Expect(link).ToBeVisibleAsync();
        await link.ClickAsync();
    }

    public Task OpenHardwareTabAsync() => _page.GetByRole(AriaRole.Button, new() { Name = "Hardware" }).ClickAsync();
}
