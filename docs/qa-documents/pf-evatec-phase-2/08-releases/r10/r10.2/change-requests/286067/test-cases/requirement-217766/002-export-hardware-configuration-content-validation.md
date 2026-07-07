# R10.2 Update for CR 286067 - Export Hardware Configuration: Verify exported file contains expected hardware configuration data (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 217766
Requirement: Export Hardware Configuration (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- A tool with a known hardware configuration (including a Magnet System role with a Standard type installed) is available.
- Reference data values are known in advance for comparison.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool. | Configuration loads. |
| 2 | Export the hardware configuration. | Export completes. The export file is available for download. |
| 3 | Open the exported file and inspect the column structure. | The file contains the expected columns and sections matching the configuration layout. |
| 4 | Cross-check exported values against the on-screen hardware configuration. | Exported values for each role and component match the values displayed in the UI. |
| 5 | Verify the Magnet System entry format for a Standard type. | The Standard Magnet System entry appears in the format `[Magnet System Number] ([Magnet System Type Article Number])`. |
| 6 | If a Prototype Magnet System is installed, verify the Prototype entry format. | The Prototype entry includes the variant code in the format required by the specification. |

## Expected Outcome
The exported hardware configuration file contains all expected fields and columns. Values match the UI configuration data. Standard Magnet System entries use the format `[Magnet System Number] ([Magnet System Type Article Number])`. Prototype entries include the variant code.
