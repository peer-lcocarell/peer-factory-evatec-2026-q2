# R10.2 Update for CR 286067 - Export Hardware Configuration: Verify the exported file uses the correct format for Prototype Magnet System entries including variant code (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 217766
Requirement: Export Hardware Configuration (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- A tool module has an installed Magnet System that is linked to a Prototype Magnet System Type with variant code `V01`.
- A second tool module (or the same module at a different configuration point) has an installed Magnet System linked to a Standard Magnet System Type.
- Export functionality is accessible on the 'Hardware Configuration' page.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the tool with the Prototype Magnet System installed. | Configuration loads and displays the installed Prototype Magnet System. |
| 2 | Export the hardware configuration. | Export file is generated and available for download. |
| 3 | Open the export file and locate the Standard Magnet System entry. | The Standard Magnet System entry appears in the format `[Magnet System Number] ([Magnet System Type Article Number])`. No variant code is appended. |
| 4 | Locate the Prototype Magnet System entry in the export. | The Prototype Magnet System entry includes the variant code in the displayed format. The entry differentiates it from Standard entries. |

## Expected Outcome
The exported Hardware Configuration file uses a distinct format for Prototype Magnet System entries that includes the variant code. Standard Magnet System entries use the base format without a variant code. Both formats include the Magnet System Number and the associated Magnet System Type Article Number.
