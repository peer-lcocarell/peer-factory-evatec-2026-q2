using Microsoft.Playwright;
using Microsoft.Playwright.NUnit;
using NUnit.Framework;
using PfEvatec.E2E.AutomatedTests.Configuration;
using PfEvatec.E2E.AutomatedTests.Pages;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Tests;

public abstract class BaseUiTest : PageTest
{
    protected TestSettings Settings { get; private set; } = null!;

    protected ShellPage Shell { get; private set; } = null!;

    [SetUp]
    public async Task SetupAsync()
    {
        Settings = TestSettingsLoader.Load();

        await Page.GotoAsync(Settings.BaseUrl);

        var loginPage = new LoginPage(Page);
        await loginPage.SignInAsync(Settings.UserName, Settings.DefaultPassword);

        Shell = new ShellPage(Page);
        await Expect(Shell.MainNavigation).ToBeVisibleAsync();
    }

    [TearDown]
    public async Task TeardownAsync()
    {
        await Shell.SignOutIfVisibleAsync();
    }

    protected static async Task AttachScreenshotAsync(IPage page, TestContext context, string name)
    {
        var image = await page.ScreenshotAsync(new() { FullPage = true });
        context.AddTestAttachment(await SaveArtifactAsync(name, image), name);
    }

    private static async Task<string> SaveArtifactAsync(string name, byte[] bytes)
    {
        var outputDir = Path.Combine(TestContext.CurrentContext.WorkDirectory, "artifacts");
        Directory.CreateDirectory(outputDir);

        var path = Path.Combine(outputDir, $"{Sanitize(name)}-{DateTime.UtcNow:yyyyMMddHHmmss}.png");
        await File.WriteAllBytesAsync(path, bytes);
        return path;
    }

    private static string Sanitize(string value)
    {
        var invalidChars = Path.GetInvalidFileNameChars();
        var sanitized = new string(value.Select(c => invalidChars.Contains(c) ? '_' : c).ToArray());
        return string.IsNullOrWhiteSpace(sanitized) ? "artifact" : sanitized;
    }
}
