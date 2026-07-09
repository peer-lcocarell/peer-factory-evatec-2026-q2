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
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();
        await _page.GetByText("Select by BPS Number").ClickAsync();
        await _page.GetByText("117713 BPS").ClickAsync();

        await _page.Locator(".btn").First.ClickAsync();
        await _page.Locator("#clr-input-2").FillAsync(boxName);
        await _page.Locator("#clr-combobox-0").FillAsync("m");
        await _page.GetByRole(AriaRole.Option, new() { Name = "3019622 - Sampling_Silex SE_CLN2_17_MSQ contamination tests" }).ClickAsync();

        await _page.Locator("#clr-input-3").FillAsync("123");
        await _page.Locator("#clr-input-4").FillAsync("Created by migration utility.");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        // Confirm that the workflow returned to the Boxes overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Boxes", RegexOptions.IgnoreCase));
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
        await _page.GetByRole(AriaRole.Button, new() { Name = "New" }).ClickAsync();
        await _page.GetByText("Define substrates manually").ClickAsync();
        await _page.Locator(".btn").First.ClickAsync();

        await _page.Locator("#clr-input-2").FillAsync(boxName);
        await _page.Locator("#clr-combobox-0").FillAsync("0");
        await _page.GetByRole(AriaRole.Option, new() { Name = "106797 - XXX" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(1).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "AUTOMATION" }).ClickAsync();

        await _page.Locator("#clr-input-4").FillAsync("comment");

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(2).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "FOUP" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Show options" }).Nth(3).ClickAsync();
        await _page.GetByRole(AriaRole.Option, new() { Name = "300mm wafer", Exact = true }).ClickAsync();

        // Apply the configured substrate values to all available slots.
        await _page.GetByRole(AriaRole.Button, new() { Name = "Add Substrate to all empty slots" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        // Confirm that the workflow returned to the Boxes overview.
        await Expect(_page).ToHaveURLAsync(new Regex("Boxes", RegexOptions.IgnoreCase));
    }
}
