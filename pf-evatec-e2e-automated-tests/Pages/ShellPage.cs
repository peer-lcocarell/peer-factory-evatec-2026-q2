using Microsoft.Playwright;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class ShellPage
{
    private readonly IPage _page;

    public ShellPage(IPage page)
    {
        _page = page;
    }

    public ILocator MainNavigation => _page.GetByRole(AriaRole.Navigation);

    public async Task OpenNavigationAsync(string linkText)
    {
        var link = _page.GetByRole(AriaRole.Link, new() { Name = linkText }).First;
        await Expect(link).ToBeVisibleAsync();
        await link.ClickAsync();
    }

    public async Task SignOutIfVisibleAsync()
    {
        var userEntry = _page.Locator("a").Filter(new() { HasTextString = "(Q3)" }).First;
        if (await userEntry.IsVisibleAsync())
        {
            await userEntry.ClickAsync();
            await _page.GetByRole(AriaRole.Button, new() { Name = "Sign Out" }).ClickAsync();
        }
    }
}
