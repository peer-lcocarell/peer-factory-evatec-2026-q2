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
/// Encapsulates tool list and tool details navigation actions.
/// </summary>
public sealed class ToolsPage
{
    private readonly IPage _page;

    /// <summary>
    /// Initializes a new instance of the <see cref="ToolsPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public ToolsPage(IPage page)
    {
        _page = page;
    }

    /// <summary>
    /// Opens tool details by displayed tool name.
    /// </summary>
    /// <param name="toolName">
    /// A visible tool name in the tools grid.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous open action.
    /// </returns>
    public async Task OpenToolByNameAsync(string toolName)
    {
        var link = _page.GetByRole(AriaRole.Link, new() { Name = toolName }).First;
        await Expect(link).ToBeVisibleAsync();
        await link.ClickAsync();
    }

    /// <summary>
    /// Opens the Hardware tab for the selected tool.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous tab action.
    /// </returns>
    public Task OpenHardwareTabAsync() => _page.GetByRole(AriaRole.Button, new() { Name = "Hardware" }).ClickAsync();
}
