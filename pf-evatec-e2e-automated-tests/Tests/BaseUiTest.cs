#region Copyright Notice
//
// Copyright(C) The PEER Group Inc., 2026.
//
// This software contains confidential and trade secret information
// belonging to The PEER Group Inc. All Rights Reserved.
//
// No part of this software may be reproduced or transmitted in any form
// or by any means, electronic, mechanical, photocopying, recording or
// otherwise, without the prior written consent of The PEER Group Inc.
//
#endregion

using Microsoft.Playwright;
using Microsoft.Playwright.NUnit;
using NUnit.Framework;
using PfEvatec.E2E.AutomatedTests.Configuration;
using PfEvatec.E2E.AutomatedTests.Pages;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Tests;

/// <summary>
/// Provides shared setup, teardown, and artifact helpers for UI tests.
/// </summary>
public abstract class BaseUiTest : PageTest
{
    /// <summary>
    /// Gets the current runtime test settings.
    /// </summary>
    protected TestSettings Settings { get; private set; } = null!;

    /// <summary>
    /// Gets the shared shell page object for navigation actions.
    /// </summary>
    protected ShellPage Shell { get; private set; } = null!;

    /// <summary>
    /// Initializes browser state and signs in before each test.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous setup.
    /// </returns>
    [SetUp]
    public async Task SetupAsync()
    {
        Settings = TestSettingsLoader.Load();
        Page.SetDefaultTimeout(30_000);

        await Page.GotoAsync(Settings.BaseUrl, new() { WaitUntil = WaitUntilState.DOMContentLoaded });
        await UiStability.WaitForPageReadyAsync(Page);

        var loginPage = new LoginPage(Page);
        await loginPage.SignInAsync(Settings.UserName, Settings.DefaultPassword);

        Shell = new ShellPage(Page);
        await Shell.EnsureReadyAsync();
    }

    /// <summary>
    /// Attempts to sign out after each test.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous teardown.
    /// </returns>
    [TearDown]
    public async Task TeardownAsync()
    {
        if (TestContext.CurrentContext.Result.Outcome.Status != NUnit.Framework.Interfaces.TestStatus.Passed)
        {
            await AttachScreenshotAsync(Page, TestContext.CurrentContext, $"failure-{TestContext.CurrentContext.Test.Name}");
        }

        try
        {
            await Shell.SignOutIfVisibleAsync();
        }
        catch (Exception ex)
        {
            TestContext.WriteLine($"Teardown sign-out skipped due to transient UI state: {ex.Message}");
        }
    }

    /// <summary>
    /// Wraps a scenario with start/end evidence and standardized failure diagnostics.
    /// </summary>
    /// <param name="scenarioName">
    /// A logical scenario identifier used in attachment names.
    /// </param>
    /// <param name="action">
    /// A test workflow action to execute.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous test wrapper.
    /// </returns>
    protected async Task RunScenarioAsync(string scenarioName, Func<Task> action)
    {
        await AttachScreenshotAsync(Page, TestContext.CurrentContext, $"start-{scenarioName}");

        try
        {
            await action();
            await AttachScreenshotAsync(Page, TestContext.CurrentContext, $"complete-{scenarioName}");
        }
        catch (Exception ex)
        {
            var classification = ClassifyFailure(ex);
            TestContext.WriteLine($"Failure classification: {classification}");
            TestContext.WriteLine($"Failure message: {ex.Message}");

            await AttachScreenshotAsync(Page, TestContext.CurrentContext, $"error-{scenarioName}");
            throw;
        }
    }

    /// <summary>
    /// Captures and attaches a full-page screenshot to the current test context.
    /// </summary>
    /// <param name="page">
    /// A Playwright page from which the screenshot is captured.
    /// </param>
    /// <param name="context">
    /// A test context used to register the saved artifact.
    /// </param>
    /// <param name="name">
    /// A logical name used for the screenshot attachment.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous attachment operation.
    /// </returns>
    protected static async Task AttachScreenshotAsync(IPage page, TestContext context, string name)
    {
        var image = await page.ScreenshotAsync(new() { FullPage = true });
        TestContext.AddTestAttachment(await SaveArtifactAsync(name, image), name);
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
        var buffer = value.ToCharArray();

        for (var index = 0; index < buffer.Length; index++)
        {
            if (Array.IndexOf(invalidChars, buffer[index]) >= 0)
            {
                buffer[index] = '_';
            }
        }

        var sanitized = new string(buffer);
        return string.IsNullOrWhiteSpace(sanitized) ? "artifact" : sanitized;
    }

    private static string ClassifyFailure(Exception ex)
    {
        var message = ex.ToString();

        if (message.Contains("was not found in the environment", StringComparison.OrdinalIgnoreCase))
        {
            return "Missing test data";
        }

        if (message.Contains("intercepts pointer events", StringComparison.OrdinalIgnoreCase) || message.Contains("modal", StringComparison.OrdinalIgnoreCase))
        {
            return "Navigation issue";
        }

        if (message.Contains("Timeout", StringComparison.OrdinalIgnoreCase))
        {
            return "Synchronization issue";
        }

        if (message.Contains("Locator expected to be visible", StringComparison.OrdinalIgnoreCase)
            || message.Contains("strict mode violation", StringComparison.OrdinalIgnoreCase))
        {
            return "Selector issue";
        }

        if (message.Contains("ERR_", StringComparison.OrdinalIgnoreCase)
            || message.Contains("ECONN", StringComparison.OrdinalIgnoreCase)
            || message.Contains("name or service not known", StringComparison.OrdinalIgnoreCase))
        {
            return "Environment issue";
        }

        if (message.Contains("500", StringComparison.OrdinalIgnoreCase)
            || message.Contains("Internal Server Error", StringComparison.OrdinalIgnoreCase))
        {
            return "Application defect";
        }

        return "Test defect";
    }
}
