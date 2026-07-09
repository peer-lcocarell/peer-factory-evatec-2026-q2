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
/// Encapsulates collection-related UI actions used by end-to-end tests.
/// </summary>
public sealed class CollectionsPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="CollectionsPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public CollectionsPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Creates a private collection and adds substrate entries.
    /// </summary>
    /// <param name="collectionName">
    /// A generated collection name used for test uniqueness.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous workflow.
    /// </returns>
    public async Task CreateCollectionWithSubstratesAsync(string collectionName)
    {
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(collectionName);

        await _page.Locator("#clr-combobox-1-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).First.ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "Lev Cocarell (LC)" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.Locator("#clr-combobox-0-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "AUTOMATED" }).ClickAsync();
        await _page.Locator(".popover-overlay").ClickAsync();

        await _page.Locator("#clr-textarea-0").FillAsync("Collection created by Playwright .NET migration utility.");

        // Select seed substrate rows in the add dialog.
        await _page.GetByRole(AriaRole.Button, new() { Name = "Add" }).ClickAsync();
        await _page.Locator("td:nth-child(2) > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label").First.ClickAsync();
        await _page.Locator("tr:nth-child(3) > .row-selector-col > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label").First.ClickAsync();
        await _page.GetByTitle("Add", new() { Exact = true }).ClickAsync();

        await _page.GetByTitle("Close").ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).First.ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        // Confirm that the workflow returned to the Collections overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Collections", RegexOptions.IgnoreCase));
    }
}
