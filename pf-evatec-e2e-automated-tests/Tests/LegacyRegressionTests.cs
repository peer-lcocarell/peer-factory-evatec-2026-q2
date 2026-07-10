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
    private static bool _corePreflightPassed;
    private static bool _toolDataReady;

    private static bool IsPreflightBypassEnabled()
    {
        var raw = Environment.GetEnvironmentVariable("PF_ALLOW_WORKFLOW_WITHOUT_PREFLIGHT");
        return string.Equals(raw, "1", StringComparison.OrdinalIgnoreCase)
            || string.Equals(raw, "true", StringComparison.OrdinalIgnoreCase)
            || string.Equals(raw, "yes", StringComparison.OrdinalIgnoreCase);
    }

    private static void RequirePreflight()
    {
        if (_corePreflightPassed || IsPreflightBypassEnabled())
        {
            return;
        }

        Assert.Fail("Preflight failed. Skipping dependent workflows. Set PF_ALLOW_WORKFLOW_WITHOUT_PREFLIGHT=true only for targeted local runs.");
    }

    private static void RequireToolData()
    {
        if (_toolDataReady || IsPreflightBypassEnabled())
        {
            return;
        }

        Assert.Fail("Required tool IDs were not found during preflight. Update PF_FOUP_TOOL_ID / PF_CASSETTE_TOOL_ID / PF_FILE_TOOL_ID or use PF_ALLOW_WORKFLOW_WITHOUT_PREFLIGHT=true for targeted local runs.");
    }

    /// <summary>
    /// Validates environment readiness and required seed data before workflow tests run.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous preflight execution.
    /// </returns>
    [Test]
    [Order(1)]
    [Category("preflight")]
    [Category("smoke")]
    public async Task Preflight_EnvironmentAndData_ReadyForRegression()
    {
        await RunScenarioAsync("preflight", async () =>
        {
            await Shell.EnsureReadyAsync();

            await Shell.OpenNavigationAsync("Home");
            await Expect(Page.Locator("body")).ToContainTextAsync("Lev Cocarell", new() { IgnoreCase = true, Timeout = 20_000 });

            var widgets = new[] { "Tools", "Boxes", "Collections", "Projects", "Analysis" };
            foreach (var widget in widgets)
            {
                await Expect(Page.Locator("body")).ToContainTextAsync(widget, new() { IgnoreCase = true, Timeout = 20_000 });
            }

            var expectedHost = new Uri(Settings.BaseUrl).Host;
            var actualHost = new Uri(Page.Url).Host;
            Assert.That(actualHost, Is.EqualTo(expectedHost), "Application did not navigate to the expected host after authentication.");

            var keyModules = new[] { "Tools", "Modules", "Projects", "Collections", "Boxes", "Analysis", "Tool Configuration" };
            foreach (var module in keyModules)
            {
                await Shell.OpenNavigationAsync(module);
                await Expect(Page.Locator("body")).ToContainTextAsync(module, new() { IgnoreCase = true, Timeout = 20_000 });
            }

            _corePreflightPassed = true;

            await Shell.OpenNavigationAsync("Tool Configuration");
            var toolConfig = new ToolConfigurationPage(Page);

            var hasFoup = await toolConfig.HasToolAsync(Settings.FoupToolId);
            var hasCassette = await toolConfig.HasToolAsync(Settings.CassetteToolId);
            var hasFile = await toolConfig.HasToolAsync(Settings.FileToolId);

            _toolDataReady = hasFoup && hasCassette && hasFile;
            if (!_toolDataReady)
            {
                TestContext.WriteLine("Preflight warning: required tool IDs not fully available in this environment.");
                TestContext.WriteLine($"FOUP ({Settings.FoupToolId}): {hasFoup}");
                TestContext.WriteLine($"Cassette ({Settings.CassetteToolId}): {hasCassette}");
                TestContext.WriteLine($"File ({Settings.FileToolId}): {hasFile}");
            }
        });
    }

    /// <summary>
    /// Verifies that primary application areas are reachable from navigation.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    [Order(2)]
    public async Task CheckAllPagesNavigation_ValidUser_CoreMenusAreReachable()
    {
        RequirePreflight();

        var menus = new[]
        {
            "Tools", "Modules", "Boxes", "Substrates", "Targets", "Collections", "Projects", "Analysis",
            "Security", "Module Types", "Manage Hardware", "Tool Types",
            "Tool Configuration", "Target Types", "Predefined Types", "Settings", "ERP", "EDP"
        };

        await RunScenarioAsync("check-all-pages", async () =>
        {
            foreach (var menu in menus)
            {
                await Shell.OpenNavigationAsync(menu);
                await Expect(Page.Locator("body")).ToContainTextAsync(menu, new() { IgnoreCase = true, Timeout = 20_000 });
            }
        });
    }

    /// <summary>
    /// Verifies that the cassette tool can be connected or is already connected.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    [Order(3)]
    public async Task ConnectCassetteTool_ValidUser_CanConnectOrIsAlreadyConnected()
    {
        RequirePreflight();
        RequireToolData();

        await RunScenarioAsync("connect-cassette-tool", async () =>
        {
            await Shell.OpenNavigationAsync("Tool Configuration");

            var toolConfig = new ToolConfigurationPage(Page);
            await toolConfig.FilterByToolNameAsync(Settings.CassetteToolId);
            await toolConfig.OpenToolByIdAsync(Settings.CassetteToolId);
            await toolConfig.ConnectAsync();
            await toolConfig.AssertConnectedOrAlreadyConnectedAsync();
            await toolConfig.BackAsync();
        });
    }

    /// <summary>
    /// Verifies that the FOUP tool can be connected or is already connected.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    [Order(4)]
    public async Task ConnectFoupTool_ValidUser_CanConnectOrIsAlreadyConnected()
    {
        RequirePreflight();
        RequireToolData();

        await RunScenarioAsync("connect-foup-tool", async () =>
        {
            await Shell.OpenNavigationAsync("Tool Configuration");

            var toolConfig = new ToolConfigurationPage(Page);
            await toolConfig.FilterByToolNameAsync(Settings.FoupToolId);
            await toolConfig.OpenToolByIdAsync(Settings.FoupToolId);
            await toolConfig.ConnectAsync();
            await toolConfig.AssertConnectedOrAlreadyConnectedAsync();
            await toolConfig.BackAsync();
        });
    }

    /// <summary>
    /// Verifies that the XRD file tool can be connected or is already connected.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Category("smoke")]
    [Order(5)]
    public async Task ConnectXrdFileTool_ValidUser_CanConnectOrIsAlreadyConnected()
    {
        RequirePreflight();
        RequireToolData();

        await RunScenarioAsync("connect-xrd-file-tool", async () =>
        {
            await Shell.OpenNavigationAsync("Tool Configuration");

            var toolConfig = new ToolConfigurationPage(Page);
            await toolConfig.FilterByToolNameAsync(Settings.FileToolId);
            await toolConfig.OpenToolByIdAsync(Settings.FileToolId);
            await toolConfig.ConnectAsync();
            await toolConfig.AssertConnectedOrAlreadyConnectedAsync();
            await toolConfig.BackAsync();
        });
    }

    /// <summary>
    /// Verifies that a private project can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Order(6)]
    public async Task CreatePrivateProject_ValidInput_ProjectSavesAndReturnsToOverview()
    {
        RequirePreflight();

        await RunScenarioAsync("create-private-project", async () =>
        {
            await Shell.OpenNavigationAsync("Projects");

            var pageObject = new ProjectsPage(Page);
            await pageObject.CreatePrivateProjectAsync($"PROJECT_AUTOMATED_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");
        });
    }

    /// <summary>
    /// Verifies that a private collection with substrates can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Order(7)]
    public async Task CreatePrivateCollectionWithSubstrates_ValidInput_CollectionSaves()
    {
        RequirePreflight();

        await RunScenarioAsync("create-private-collection", async () =>
        {
            await Shell.OpenNavigationAsync("Collections");

            var pageObject = new CollectionsPage(Page);
            await pageObject.CreateCollectionWithSubstratesAsync($"COLLECTION_AUTOMATED_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");
        });
    }

    /// <summary>
    /// Verifies that a box can be created from a BPS selection.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Order(8)]
    public async Task CreateBoxFromBps_ValidInput_BoxSaves()
    {
        RequirePreflight();

        await RunScenarioAsync("create-box-from-bps", async () =>
        {
            await Shell.OpenNavigationAsync("Boxes");

            var pageObject = new BoxesPage(Page);
            await pageObject.CreateBoxFromBpsAsync($"BOX_BPS_{DateTime.UtcNow:yyyyMMddHHmmss}");
        });
    }

    /// <summary>
    /// Verifies that a box can be created with manual substrate configuration.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Order(9)]
    public async Task CreateBoxWithManualSubstrates_ValidInput_BoxSaves()
    {
        RequirePreflight();

        await RunScenarioAsync("create-box-manual", async () =>
        {
            await Shell.OpenNavigationAsync("Boxes");

            var pageObject = new BoxesPage(Page);
            await pageObject.CreateBoxWithManualSubstratesAsync($"BOX_MANUAL_{DateTime.UtcNow:yyyyMMddHHmmss}");
        });
    }

    /// <summary>
    /// Verifies that a module type can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Order(10)]
    public async Task CreateModuleType_ValidInput_ModuleTypeSaves()
    {
        RequirePreflight();

        await RunScenarioAsync("create-module-type", async () =>
        {
            await Shell.OpenNavigationAsync("Module Types");

            var pageObject = new ModuleTypesPage(Page);
            await pageObject.CreateModuleTypeAsync($"MODULE_TYPE_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");
        });
    }

    /// <summary>
    /// Verifies that a tool type can be created and saved.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Order(11)]
    public async Task CreateToolType_ValidInput_ToolTypeSaves()
    {
        RequirePreflight();

        await RunScenarioAsync("create-tool-type", async () =>
        {
            await Shell.OpenNavigationAsync("Tool Types");

            var pageObject = new ToolTypesPage(Page);
            await pageObject.CreateToolTypeAsync($"TOOL_TYPE_R10_2_{DateTime.UtcNow:yyyyMMddHHmmss}");
        });
    }

    /// <summary>
    /// Verifies that BOM import can be executed from hardware configuration.
    /// </summary>
    /// <returns>
    /// A task that represents the asynchronous test execution.
    /// </returns>
    [Test]
    [Order(12)]
    public async Task ImportBomForHardwareConfiguration_ValidBps_BomCanBeImported()
    {
        RequirePreflight();
        RequireToolData();

        await RunScenarioAsync("import-bom-hardware-config", async () =>
        {
            await Shell.OpenNavigationAsync("Tools");

            var toolsPage = new ToolsPage(Page);
            await toolsPage.OpenToolByNameAsync("AUTOMATION_FOUP_TOOL");
            await toolsPage.OpenHardwareTabAsync();

            var hardwarePage = new HardwareConfigurationPage(Page);
            await hardwarePage.ImportBomByBpsAsync("V315015");
        });
    }
}
