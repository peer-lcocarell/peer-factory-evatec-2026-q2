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
using System.Text.RegularExpressions;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Pages;

/// <summary>
/// Encapsulates tool-type management actions used by end-to-end tests.
/// </summary>
public sealed class ToolTypesPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="ToolTypesPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public ToolTypesPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Creates a tool type and adds at least one supported module.
    /// </summary>
    /// <param name="toolTypeName">
    /// A generated tool-type name used for test uniqueness.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous workflow.
    /// </returns>
    public async Task CreateToolTypeAsync(string toolTypeName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(toolTypeName);
        await _page.Locator("#clr-textarea-0").FillAsync("Tool type created by .NET migration utility.");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).First.ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Module_Type_C.R8.0_QA3_230130" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Add Module" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        // Confirm that the workflow returned to the Tool Types overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Tool", RegexOptions.IgnoreCase));
    }
}
