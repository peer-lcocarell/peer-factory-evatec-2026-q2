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
/// Encapsulates project-management actions used by end-to-end tests.
/// </summary>
public sealed class ProjectsPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="ProjectsPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public ProjectsPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Creates a private project with tag, work order, and sharing metadata.
    /// </summary>
    /// <param name="projectName">
    /// A generated project name used for test uniqueness.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous workflow.
    /// </returns>
    public async Task CreatePrivateProjectAsync(string projectName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(projectName);
        await _page.Locator("#clr-combobox-1-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Automated" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.Locator("#clr-combobox-0").FillAsync("sam");
        await _page.GetByRole(AriaRole.Option, new() { Name = "3044445 - Sampling Olympus SiO2, ITO 300mm" }).ClickAsync();

        await _page.Locator("#clr-textarea-0").FillAsync($"Created by automated test {DateTime.UtcNow:O}");

        await _page.Locator("#clr-combobox-2-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Lev Cocarell (LC)" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        // Confirm that the workflow returned to the Projects overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Projects", RegexOptions.IgnoreCase));
    }
}
