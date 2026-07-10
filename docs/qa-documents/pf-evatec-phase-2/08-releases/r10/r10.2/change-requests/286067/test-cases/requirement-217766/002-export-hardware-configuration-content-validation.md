# R10.2 Update for CR 286067 - Export Hardware Configuration: Verify exported file content, metadata, and formatting rules (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 217766
Requirement: Export Hardware Configuration (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- A tool with a known hardware configuration is available, including:
	- at least one ERP Target,
	- at least one user-defined Target,
	- one Standard Magnet System,
	- one Prototype Magnet System with variant code.
- Reference data values are known in advance for comparison.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool. | Configuration loads. |
| 2 | Export the hardware configuration. | Export completes. The export file is available for download. |
| 3 | Open the exported file and inspect the column structure. | The file contains the expected columns and sections matching the configuration layout. |
| 4 | Verify exported metadata fields. | Tool Name is present. Module Name and Module Type are present when applicable. Selected date and last modified timestamp are present. |
| 5 | Cross-check exported role data against the UI. | Exported category, Article #, name/value, and serial # values match the on-screen hardware configuration. |
| 6 | Verify ERP Target entry format. | ERP Target entries appear as `[Target #] ([Target Type Article #])`. |
| 7 | Verify user-defined Target entry format. | User-defined Target entries appear as `[Target #]` without target type article suffix. |
| 8 | Verify Standard Magnet System entry format. | Standard Magnet System entries appear as `[Magnet System #] ([Magnet System Type Article #])`. |
| 9 | Verify Prototype Magnet System entry format. | Prototype Magnet System entries appear as `[Magnet System #] ([Magnet System Type Article #] [Variant Code])`. |

## Expected Outcome
The exported hardware configuration file includes required metadata, role values, and target/magnet formatting rules. Exported values match UI configuration data, including ERP and user-defined target formats and Standard/Prototype magnet formats with correct variant code handling.
