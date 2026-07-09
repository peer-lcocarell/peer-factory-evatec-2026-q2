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
/// Encapsulates module-type management actions used by end-to-end tests.
/// </summary>
public sealed class ModuleTypesPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="ModuleTypesPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public ModuleTypesPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Creates a module type with generated metadata.
    /// </summary>
    /// <param name="moduleName">
    /// A generated module-type name used for test uniqueness.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous workflow.
    /// </returns>
    public async Task CreateModuleTypeAsync(string moduleName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(moduleName);
        await _page.Locator("#clr-input-3").FillAsync($"Short {DateTime.UtcNow:HHmmss}");
        await _page.Locator("#clr-textarea-0").FillAsync("Module type created by .NET migration utility.");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        // Confirm that the workflow returned to the Module Types overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Module", RegexOptions.IgnoreCase));
    }
}
