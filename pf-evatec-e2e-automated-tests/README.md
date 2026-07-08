# pf-evatec-e2e-automated-tests

Playwright for .NET migration utility for legacy JavaScript E2E coverage.

## What this project contains

- NUnit + Playwright for .NET test project.

- Shared config in Configuration/testsettings.json.

- Maintainable Page Objects in Pages/.

- Migrated legacy scenarios in Tests/LegacyRegressionTests.cs.

## Legacy to .NET mapping

- check-all-pages.spec.js -> CheckAllPagesNavigation_ValidUser_CoreMenusAreReachable

- connect-cassette-tool.spec.js -> ConnectCassetteTool_ValidUser_CanConnectOrIsAlreadyConnected

- connect-foup-tool.spec.js -> ConnectFoupTool_ValidUser_CanConnectOrIsAlreadyConnected

- connect-xrd-file-tool.spec.js -> ConnectXrdFileTool_ValidUser_CanConnectOrIsAlreadyConnected

- create-new-project.spec.js -> CreatePrivateProject_ValidInput_ProjectSavesAndReturnsToOverview

- create-private-collection-with-substrates.spec.js -> CreatePrivateCollectionWithSubstrates_ValidInput_CollectionSaves

- create-new-box-from-bps.spec.js -> CreateBoxFromBps_ValidInput_BoxSaves

- create-new-box.spec.js -> CreateBoxWithManualSubstrates_ValidInput_BoxSaves

- create-new-module-type.spec.js -> CreateModuleType_ValidInput_ModuleTypeSaves

- create-new-tool-type.spec.js -> CreateToolType_ValidInput_ToolTypeSaves

- perform-bom-import-for-hardware-configuration.spec.js -> ImportBomForHardwareConfiguration_ValidBps_BomCanBeImported

## Run locally

1. Install browser dependencies:

```powershell
dotnet tool restore
dotnet build
pwsh bin/Debug/net8.0/playwright.ps1 install
```

2. Execute the tests:

```powershell
dotnet test
```

## Configuration

- Use Configuration/testsettings.json for default values.

- Override base URL at runtime with environment variable PF_BASE_URL.

## Best-practice changes from legacy tests

- Replaced ad-hoc helper scripts with Page Objects.

- Removed hard waits and kept Playwright auto-waiting behavior.

- Added explicit web assertions for key workflow states.

- Isolated test setup and teardown in a reusable base class.

- Standardized test names to method_state_expected format.
