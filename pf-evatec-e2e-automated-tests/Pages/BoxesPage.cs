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
/// Encapsulates box-related UI actions used by end-to-end tests.
/// </summary>
public sealed class BoxesPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="BoxesPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public BoxesPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Creates a box from a predefined BPS selection.
    /// </summary>
    /// <param name="boxName">
    /// A generated box name used for test uniqueness.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous workflow.
    /// </returns>
    public async Task CreateBoxFromBpsAsync(string boxName)
    {
        await UiStability.WaitForPageReadyAsync(_page);

        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "New" }).First, _page, "Boxes New");

        var bpsMode = _page.GetByText("Select by BPS Number").First;
        if (await bpsMode.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(bpsMode, _page, "Select by BPS Number");

            var bpsSelection = _page.GetByText("117713 BPS").First;
            await Expect(bpsSelection).ToBeVisibleAsync(new() { Timeout = 30_000 });
            await UiStability.SafeClickAsync(bpsSelection, _page, "Select BPS 117713");

            await UiStability.SafeClickAsync(_page.Locator(".btn").First, _page, "Confirm BPS selection");
            await UiStability.SafeFillAsync(_page.Locator("#clr-input-2"), _page, boxName);
            await UiStability.SafeFillAsync(_page.Locator("#clr-combobox-0"), _page, "m");

            var articleOption = _page.GetByRole(AriaRole.Option, new() { Name = "3019622 - Sampling_Silex SE_CLN2_17_MSQ contamination tests" }).First;
            await Expect(articleOption).ToBeVisibleAsync(new() { Timeout = 30_000 });
            await UiStability.SafeClickAsync(articleOption, _page, "Select article option");

            await UiStability.SafeFillAsync(_page.Locator("#clr-input-3"), _page, "123");
            await UiStability.SafeFillAsync(_page.Locator("#clr-input-4"), _page, "Created by migration utility.");
        }
        else
        {
            await CreateBoxFromArticleFlowAsync(boxName);
        }

        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Save" }).First, _page, "Save box from BPS");
        var backButton = _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).First;
        if (await backButton.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(backButton, _page, "Back to Boxes overview");
        }

        // Confirm that the workflow returned to the Boxes overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Boxes", RegexOptions.IgnoreCase));
    }

    private async Task CreateBoxFromArticleFlowAsync(string boxName)
    {
        var selectByArticle = _page.GetByText("Select by Article #").First;
        if (!await selectByArticle.IsVisibleAsync())
        {
            throw new PlaywrightException("Neither 'Select by BPS Number' nor 'Select by Article #' creation modes are available.");
        }

        await UiStability.SafeClickAsync(selectByArticle, _page, "Select by Article");

        var firstArticleCell = _page.Locator("td").Filter(new() { HasTextString = "Si DSP" }).First;
        if (await firstArticleCell.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(firstArticleCell, _page, "Select article row");
        }
        else
        {
            await UiStability.SafeClickAsync(_page.Locator("tbody tr").First, _page, "Select first article row");
        }

        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Next" }).First, _page, "Article wizard Next");

        var confirmYes = _page.GetByRole(AriaRole.Button, new() { Name = "Yes" }).First;
        if (await confirmYes.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(confirmYes, _page, "Confirm article wizard");
        }

        var boxNameInput = _page.Locator("input[id^='clr-input-']:visible").First;
        await UiStability.SafeFillAsync(boxNameInput, _page, boxName);

        var workOrderDropDown = _page.Locator("#clr-combobox-4-combobox").GetByRole(AriaRole.Button, new() { Name = "Show options" }).First;
        if (await workOrderDropDown.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(workOrderDropDown, _page, "Open work order options");

            var preferredWorkOrder = _page.GetByRole(AriaRole.Option, new() { Name = "3034514 -" }).First;
            if (await preferredWorkOrder.IsVisibleAsync())
            {
                await UiStability.SafeClickAsync(preferredWorkOrder, _page, "Select preferred work order");
            }
            else
            {
                await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Option).First, _page, "Select first available work order");
            }
        }

        if (await _page.Locator(".popover-overlay").First.IsVisibleAsync())
        {
            await UiStability.SafeClickAsync(_page.Locator(".popover-overlay").First, _page, "Close popover overlay");
        }
    }

    /// <summary>
    /// Creates a box by manually defining substrate metadata.
    /// </summary>
    /// <param name="boxName">
    /// A generated box name used for test uniqueness.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous workflow.
    /// </returns>
    public async Task CreateBoxWithManualSubstratesAsync(string boxName)
    {
        await UiStability.WaitForPageReadyAsync(_page);

        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "New" }).First, _page, "Boxes New");
        await UiStability.SafeClickAsync(_page.GetByText("Define substrates manually").First, _page, "Define substrates manually");
        await UiStability.SafeClickAsync(_page.Locator(".btn").First, _page, "Confirm manual substrates mode");

        await UiStability.SafeFillAsync(_page.Locator("#clr-input-2"), _page, boxName);
        await UiStability.SafeFillAsync(_page.Locator("#clr-combobox-0"), _page, "0");

        var waferOption = _page.GetByRole(AriaRole.Option, new() { Name = "106797 - XXX" }).First;
        await Expect(waferOption).ToBeVisibleAsync(new() { Timeout = 30_000 });
        await UiStability.SafeClickAsync(waferOption, _page, "Select substrate article");

        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(1), _page, "Open owner options");
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Option, new() { Name = "AUTOMATION" }).First, _page, "Select owner AUTOMATION");

        await UiStability.SafeFillAsync(_page.Locator("#clr-input-4"), _page, "comment");

        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(2), _page, "Open carrier options");
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Option, new() { Name = "FOUP" }).First, _page, "Select carrier FOUP");

        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(3), _page, "Open substrate type options");
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Option, new() { Name = "300mm wafer", Exact = true }).First, _page, "Select substrate type 300mm wafer");

        // Apply the configured substrate values to all available slots.
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Add Substrate to all empty slots" }).First, _page, "Add substrates to empty slots");
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Save" }).First, _page, "Save manual box");
        await UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Back" }).First, _page, "Back to Boxes overview");

        // Confirm that the workflow returned to the Boxes overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Boxes", RegexOptions.IgnoreCase));
    }
}
