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
/// Encapsulates tool-configuration actions used by connection tests.
/// </summary>
public sealed class ToolConfigurationPage
{
    private readonly IPage _page;
    private readonly ILocator _inlineFilter;

    /// <summary>
    /// Initializes a new instance of the <see cref="ToolConfigurationPage" /> class.
    /// </summary>
    /// <param name="page">
    /// A Playwright page used to interact with the UI.
    /// </param>
    public ToolConfigurationPage(IPage page)
    {
        _page = page;
        _inlineFilter = _page.Locator(".col-name > .datagrid-inline-filter > .clr-input").First;
    }

    /// <summary>
    /// Filters the tool grid by name.
    /// </summary>
    /// <param name="filterValue">
    /// A text value entered into the inline name filter.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous filter action.
    /// </returns>
    public async Task FilterByToolNameAsync(string filterValue)
    {
        await UiStability.SafeFillAsync(_inlineFilter, _page, filterValue);
        await _inlineFilter.PressAsync("Enter");
        await UiStability.WaitForBusyUiToClearAsync(_page);
    }

    /// <summary>
    /// Opens a tool details page by tool identifier.
    /// </summary>
    /// <param name="toolId">
    /// A tool identifier displayed as a link in the grid.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous open action.
    /// </returns>
    public async Task OpenToolByIdAsync(string toolId)
    {
        await UiStability.WaitForPageReadyAsync(_page);
        var toolLink = _page.GetByRole(AriaRole.Link, new() { Name = toolId }).First;
        await Expect(toolLink).ToBeVisibleAsync(new() { Timeout = 10_000 });
        await UiStability.SafeClickAsync(toolLink, _page, $"Tool link '{toolId}'");
        await UiStability.WaitForPageReadyAsync(_page);
    }

    /// <summary>
    /// Ensures a required tool exists in the active environment.
    /// </summary>
    /// <param name="toolId">
    /// A tool identifier that must exist.
    /// </param>
    /// <param name="toolLabel">
    /// A friendly label for diagnostics.
    /// </param>
    /// <returns>
    /// A task that represents the asynchronous validation.
    /// </returns>
    /// <exception cref="PlaywrightException">
    /// The required tool is not found in the current environment.
    /// </exception>
    public async Task EnsureToolExistsAsync(string toolId, string toolLabel)
    {
        var found = await HasToolAsync(toolId);
        if (!found)
        {
            throw new PlaywrightException($"Required {toolLabel} tool '{toolId}' was not found in the environment.");
        }
    }

    /// <summary>
    /// Checks whether a tool ID is present in the current tool-configuration grid.
    /// </summary>
    /// <param name="toolId">
    /// A tool identifier to locate.
    /// </param>
    /// <returns>
    /// True when a matching tool link is visible; otherwise false.
    /// </returns>
    public async Task<bool> HasToolAsync(string toolId)
    {
        await FilterByToolNameAsync(toolId);

        var toolLink = _page.GetByRole(AriaRole.Link, new() { Name = toolId }).First;
        return await toolLink.IsVisibleAsync();
    }

    /// <summary>
    /// Clicks the connect action for the current tool.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous connect action.
    /// </returns>
    public async Task ConnectAsync()
    {
        var connectButton = _page.GetByRole(AriaRole.Button, new() { Name = "Connect" }).First;
        await UiStability.SafeClickAsync(connectButton, _page, "Connect tool");
        await UiStability.WaitForBusyUiToClearAsync(_page);
    }

    /// <summary>
    /// Verifies that the tool is either connected or still connectable.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous assertion.
    /// </returns>
    /// <exception cref="PlaywrightException">
    /// The tool state cannot be validated as connected or connectable.
    /// </exception>
    public async Task AssertConnectedOrAlreadyConnectedAsync()
    {
        var disconnectText = _page.GetByText("Disconnect", new() { Exact = true }).First;
        var connectButton = _page.GetByRole(AriaRole.Button, new() { Name = "Connect" });

        var connected = await disconnectText.IsVisibleAsync();
        var stillConnectable = await connectButton.IsVisibleAsync();

        if (!connected && !stillConnectable)
        {
            throw new PlaywrightException("Tool state is neither connected nor connectable.");
        }
    }

    /// <summary>
    /// Navigates back from the current tool details context.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous navigation action.
    /// </returns>
    public Task BackAsync() => UiStability.SafeClickAsync(_page.GetByRole(AriaRole.Button, new() { Name = "Back" }).First, _page, "Tool details Back");
}
