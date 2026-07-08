using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class ToolConfigurationPage
{
    private readonly IPage _page;

    public ToolConfigurationPage(IPage page)
    {
        _page = page;
    }

    public async Task FilterByToolNameAsync(string filterValue)
    {
        var inlineFilter = _page.Locator(".col-name > .datagrid-inline-filter > .clr-input").First;
        await inlineFilter.FillAsync(filterValue);
        await inlineFilter.PressAsync("Enter");
    }

    public async Task OpenToolByIdAsync(string toolId)
    {
        var toolLink = _page.GetByRole(AriaRole.Link, new() { Name = toolId }).First;
        await Expect(toolLink).ToBeVisibleAsync();
        await toolLink.ClickAsync();
    }

    public async Task ConnectAsync()
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "Connect" }).ClickAsync();
    }

    public async Task AssertConnectedOrAlreadyConnectedAsync()
    {
        var disconnectText = _page.GetByText("Disconnect", new() { Exact = true }).First;
        var connectButton = _page.GetByRole(AriaRole.Button, new() { Name = "Connect" });

        var connected = await disconnectText.IsVisibleAsync();
        var stillConnectable = await connectButton.IsVisibleAsync();

        if (!connected && !stillConnectable)
        {
            throw new PlaywrightException("Tool state is neither connected nor connectable.");
        }
    }

    public Task BackAsync() => _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();
}
