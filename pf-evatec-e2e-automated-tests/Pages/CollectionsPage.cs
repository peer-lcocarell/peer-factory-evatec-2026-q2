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
        await UiStability.WaitForPageReadyAsync(_page);
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "New" }).First, _page, "Collections New");

        await UiStability.SafeFillAsync(_page.Locator("#clr-input-2"), _page, collectionName);

        await UiStability.SafeClickAsync(_page.Locator("#clr-combobox-1-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).First, _page, "Open collection owner options");
        var ownerOption = _page.GetByRole(AriaRole.Option).First;
        await Expect(ownerOption).ToBeVisibleAsync(new() { Timeout = 20_000 });
        await UiStability.SafeClickAsync(ownerOption, _page, "Select collection owner");
        if (await _page.Locator(".popover-overlay").First.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(_page.Locator(".popover-overlay").First, _page, "Close collection owner popover");
        }

        await UiStability.SafeClickAsync(_page.Locator("#clr-combobox-0-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).First, _page, "Open collection type options");
        var collectionTypeOption = _page.GetByRole(AriaRole.Option, new() { Name = "AUTOMATED" }).First;
        if (!await collectionTypeOption.IsVisibleAsync())
        {
            collectionTypeOption = _page.GetByRole(AriaRole.Option).First;
        }

        await Expect(collectionTypeOption).ToBeVisibleAsync(new() { Timeout = 20_000 });
        await UiStability.SafeClickAsync(collectionTypeOption, _page, "Select collection type AUTOMATED");
        if (await _page.Locator(".popover-overlay").First.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(_page.Locator(".popover-overlay").First, _page, "Close collection type popover");
        }

        await UiStability.SafeFillAsync(_page.Locator("#clr-textarea-0"), _page, "Collection created by Playwright .NET migration utility.");

        // Select seed substrate rows in the add dialog.
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Add" }).First, _page, "Open substrate add dialog");
        await UiStability.SafeClickAsync(_page.Locator("td:nth-child(2) > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label").First, _page, "Select first substrate row");
        await UiStability.SafeClickAsync(_page.Locator("tr:nth-child(3) > .row-selector-col > .datagrid-select > .clr-checkbox-wrapper > .clr-control-label").First, _page, "Select second substrate row");
        await UiStability.SafeClickAsync(_page.GetByTitle("Add", new() { Exact = true }).First, _page, "Confirm substrate add");

        await UiStability.SafeClickAsync(_page.GetByTitle("Close").First, _page, "Close add substrate dialog");
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Save" }).First, _page, "Save collection");
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Back" }).First, _page, "Back to Collections overview");

        // Confirm that the workflow returned to the Collections overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Collections", RegexOptions.IgnoreCase));
    }
}
