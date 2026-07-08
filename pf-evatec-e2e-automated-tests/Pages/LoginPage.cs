using Microsoft.Playwright;

namespace PfEvatec.E2E.AutomatedTests.Pages;

public sealed class LoginPage
{
    private readonly IPage _page;

    public LoginPage(IPage page)
    {
        _page = page;
    }

    public async Task SignInAsync(string userName, string password)
    {
        await _page.Locator("#clr-input-0").FillAsync(userName);
        await _page.Locator("#clr-password-0").FillAsync(password);
        await _page.GetByRole(AriaRole.Button, new() { Name = "Sign In" }).ClickAsync();
    }
}
