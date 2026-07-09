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
/// Encapsulates hardware configuration actions for tool workflows.
/// </summary>
public sealed class HardwareConfigurationPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="HardwareConfigurationPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public HardwareConfigurationPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Imports a BOM for the selected hardware component using a BPS identifier.
    /// </summary>
    /// <param name="bpsNumber">
    /// A BPS number used to retrieve BOM data.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous workflow.
    /// </returns>
    public async Task ImportBomByBpsAsync(string bpsNumber)
    {
        // Traverse into the hardware change dialog from the active hardware table.
        await _page.GetByRole(AriaRole.Cell, new() { Name = "SPM6" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "All" }).ClickAsync();

        await _page.GetByRole(AriaRole.Row, new() { Name = "Logbook - Role - Active Hardware Change Hardware Component 1:1" })
            .GetByRole(AriaRole.Button, new() { Name = "Change Hardware Component" })
            .ClickAsync();

        await _page.Locator(".modal-footer > div > button:nth-child(3)").ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Import" }).ClickAsync();

        var bpsSearch = _page.GetByPlaceholder("Search BPS #");
        await bpsSearch.FillAsync(bpsNumber);

        await _page.GetByRole(AriaRole.Button, new() { Name = "Advanced BPS Search" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Import BOM" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Save" }).ClickAsync();

        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();
        await _page.GetByRole(AriaRole.Button, new() { Name = "Back" }).ClickAsync();

        // Confirm that the workflow returned to the Tools context.
        await Expect(_page).ToHaveURLAsync(new Regex("Tools", RegexOptions.IgnoreCase));
    }
}
