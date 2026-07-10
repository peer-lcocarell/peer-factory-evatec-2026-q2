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
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

/// <summary>
/// Encapsulates shared shell navigation and session actions.
/// </summary>
public sealed class ShellPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="ShellPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public ShellPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Gets the primary navigation region.
    /// </summary>
    public ILocator MainNavigation => _page.GetByRole(AriaRole.Navigation);

    /// <summary>
    /// Opens a navigation item by visible link text.
    /// </summary>
    /// <param name="linkText">
    /// A link label shown in the left navigation menu.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous navigation action.
    /// </returns>
    public async Task OpenNavigationAsync(string linkText)
    {
        var link = _page.GetByRole(AriaRole.Link, new() { Name = linkText }).First;
        await UiStability.WaitForPageReadyAsync(_page);
        await UiStability.SafeClickAsync(link, _page, $"Navigation link '{linkText}'");
        await UiStability.WaitForPageReadyAsync(_page);
    }

    /// <summary>
    /// Signs out when the current user menu is available.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous sign-out check.
    /// </returns>
    public async Task SignOutIfVisibleAsync()
    {
        var userEntry = _page.Locator("a").Filter(new() { HasTextString = "(" }).First;
        if (await userEntry.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(userEntry, _page, "User menu");

            var signOut = _page.GetByRole(AriaRole.Button, new() { Name = "Sign Out" }).First;
            if (await signOut.IsVisibleAsync())
            {
                await UiStability.SafeClickAsync(signOut, _page, "Sign Out");
            }
        }
    }

    /// <summary>
    /// Ensures the shell and primary navigation are ready for interaction.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous readiness check.
    /// </returns>
    public async Task EnsureReadyAsync()
    {
        await UiStability.WaitForPageReadyAsync(_page);
        await Expect(MainNavigation).ToBeVisibleAsync(new() { Timeout = 20_000 });
    }
}
