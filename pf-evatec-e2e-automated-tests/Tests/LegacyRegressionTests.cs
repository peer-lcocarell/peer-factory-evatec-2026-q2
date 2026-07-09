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
using NUnit.Framework;
using PfEvatec.E2E.AutomatedTests.Pages;
using static Microsoft.Playwright.Assertions;

namespace PfEvatec.E2E.AutomatedTests.Tests;

/// <summary>
/// Contains migrated legacy regression scenarios for core Evatec workflows.
/// </summary>
[TestFixture]
[Parallelizable(ParallelScope.Self)]
public sealed class LegacyRegressionTests : BaseUiTest
{
    /// <summary>
    /// Verifies that primary application areas are reachable from navigation.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    public async Task CheckAllPagesNavigation_ValidUser_CoreMenusAreReachable()
    {
        var menus = new[]
        {
            "Tools", "Boxes", "Substrates", "Targets", "Collections", "Projects",
            "Security", "Module Types", "Manage Hardware", "Tool Types",
            "Tool Configuration", "Target Types", "Predefined Types", "Settings", "BPS", "EDP"
        };

        foreach (var menu in menus)
        {
            await Shell.OpenNavigationAsync(menu);
            await Expect(Page.Locator("body")).ToContainTextAsync(menu, new() { IgnoreCase = true, Timeout = 15_000 });
        }

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "check-all-pages");
    }

    /// <summary>
    /// Verifies that the cassette tool can be connected or is already connected.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    public async Task ConnectCassetteTool_ValidUser_CanConnectOrIsAlreadyConnected()
    {
        await Shell.OpenNavigationAsync("Tool Configuration");

        var toolConfig = new ToolConfigurationPage(Page);
        await toolConfig.FilterByToolNameAsync("automation");
        await toolConfig.OpenToolByIdAsync(Settings.CassetteToolId);
        await toolConfig.ConnectAsync();
        await toolConfig.AssertConnectedOrAlreadyConnectedAsync();

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "connect-cassette-tool");
        await toolConfig.BackAsync();
    }

    /// <summary>
    /// Verifies that the FOUP tool can be connected or is already connected.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    public async Task ConnectFoupTool_ValidUser_CanConnectOrIsAlreadyConnected()
    {
        await Shell.OpenNavigationAsync("Tool Configuration");

        var toolConfig = new ToolConfigurationPage(Page);
        await toolConfig.FilterByToolNameAsync("automation");
        await toolConfig.OpenToolByIdAsync(Settings.FoupToolId);
        await toolConfig.ConnectAsync();
        await toolConfig.AssertConnectedOrAlreadyConnectedAsync();

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "connect-foup-tool");
        await toolConfig.BackAsync();
    }

    /// <summary>
    /// Verifies that the XRD file tool can be connected or is already connected.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    public async Task ConnectXrdFileTool_ValidUser_CanConnectOrIsAlreadyConnected()
    {
        await Shell.OpenNavigationAsync("Tool Configuration");

        var toolConfig = new ToolConfigurationPage(Page);
        await toolConfig.FilterByToolNameAsync("automation");
        await toolConfig.OpenToolByIdAsync(Settings.FileToolId);
        await toolConfig.ConnectAsync();
        await toolConfig.AssertConnectedOrAlreadyConnectedAsync();

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "connect-xrd-file-tool");
        await toolConfig.BackAsync();
    }

    /// <summary>
    /// Verifies that a private project can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    public async Task CreatePrivateProject_ValidInput_ProjectSavesAndReturnsToOverview()
    {
        await Shell.OpenNavigationAsync("Projects");

        var pageObject = new ProjectsPage(Page);
        await pageObject.CreatePrivateProjectAsync($"PROJECT_AUTOMATED_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "create-private-project");
    }

    /// <summary>
    /// Verifies that a private collection with substrates can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    public async Task CreatePrivateCollectionWithSubstrates_ValidInput_CollectionSaves()
    {
        await Shell.OpenNavigationAsync("Collections");

        var pageObject = new CollectionsPage(Page);
        await pageObject.CreateCollectionWithSubstratesAsync($"COLLECTION_AUTOMATED_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "create-private-collection");
    }

    /// <summary>
    /// Verifies that a box can be created from a BPS selection.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    public async Task CreateBoxFromBps_ValidInput_BoxSaves()
    {
        await Shell.OpenNavigationAsync("Boxes");

        var pageObject = new BoxesPage(Page);
        await pageObject.CreateBoxFromBpsAsync($"BOX_BPS_{DateTime.UtcNow:yyyyMMddHHmmss}");

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "create-box-from-bps");
    }

    /// <summary>
    /// Verifies that a box can be created with manual substrate configuration.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    public async Task CreateBoxWithManualSubstrates_ValidInput_BoxSaves()
    {
        await Shell.OpenNavigationAsync("Boxes");

        var pageObject = new BoxesPage(Page);
        await pageObject.CreateBoxWithManualSubstratesAsync($"BOX_MANUAL_{DateTime.UtcNow:yyyyMMddHHmmss}");

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "create-box-manual");
    }

    /// <summary>
    /// Verifies that a module type can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    public async Task CreateModuleType_ValidInput_ModuleTypeSaves()
    {
        await Shell.OpenNavigationAsync("Module Types");

        var pageObject = new ModuleTypesPage(Page);
        await pageObject.CreateModuleTypeAsync($"MODULE_TYPE_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "create-module-type");
    }

    /// <summary>
    /// Verifies that a tool type can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    public async Task CreateToolType_ValidInput_ToolTypeSaves()
    {
        await Shell.OpenNavigationAsync("Tool Types");

        var pageObject = new ToolTypesPage(Page);
        await pageObject.CreateToolTypeAsync($"TOOL_TYPE_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "create-tool-type");
    }

    /// <summary>
    /// Verifies that BOM import can be executed from hardware configuration.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    public async Task ImportBomForHardwareConfiguration_ValidBps_BomCanBeImported()
    {
        await Shell.OpenNavigationAsync("Tools");

        var toolsPage = new ToolsPage(Page);
        await toolsPage.OpenToolByNameAsync("AUTOMATION_FOUP_TOOL");
        await toolsPage.OpenHardwareTabAsync();

        var hardwarePage = new HardwareConfigurationPage(Page);
        await hardwarePage.ImportBomByBpsAsync("V315015");

        await AttachScreenshotAsync(Page, TestContext.CurrentContext, "import-bom-hardware-config");
    }
}
