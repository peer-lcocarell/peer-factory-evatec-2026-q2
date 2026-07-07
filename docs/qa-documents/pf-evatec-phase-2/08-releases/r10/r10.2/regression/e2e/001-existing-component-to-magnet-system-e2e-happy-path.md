# R10.2 Update for CR 286067 - End-to-End Magnet System Lifecycle: Verify an existing hardware component can be converted to a Magnet System Type, a Magnet System created, checked out, installed, and traced through history and export (Scenario)

## Requirement
CR: 286067
Ticket: 35008
Requirement IDs: 290757, 290765, 290777, 217766, 290771, 73375
Requirement: End-to-End Magnet System Lifecycle (Cross-Cutting Scenario)

## Preconditions
- User is signed in with `MagnetSystemType_Edit`, `MagnetSystem_Edit`, `HardwareConfiguration_Edit`, `HardwareConfiguration_View`, `Logbook_View`, and `ManageHardware_View` permissions.
- A Hardware Component exists that has not previously been assigned as a Target Type or Magnet System Type.
- The Hardware Component has a valid ERP Article Number.
- A tool with at least one module configured for a Magnet System role slot exists.
- The 'Magnet System Types' page, 'Magnet Systems' page, 'Hardware Configuration' page, Logbook, and export functionality are all accessible.
- Assumption A01 applies (see assumptions.md): right names are assumed.
- Assumption A02 applies (see assumptions.md): Install is treated as a distinct action from Change.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to the 'Magnet System Types' page and select the 'New' action. | The 'New Magnet System Type' creation screen loads. The ERP article selector is displayed. Manual type entry is disabled. |
| 2 | Select the ERP article corresponding to the target Hardware Component. | Article Number, Name, and ERP Status populate from ERP data and are displayed as read-only. |
| 3 | Enter a valid Source Type, FlexiCat Type, and at least one Applications value. Save the new Magnet System Type. | The new Magnet System Type is saved and appears in the 'Magnet System Types' list. A creation history entry is written with the current user and timestamp. |
| 4 | Navigate to the 'Magnet Systems' page and select the 'New' action. | The 'New Magnet System' creation screen loads. |
| 5 | Enter a unique Serial Number, select the newly created Magnet System Type, and save. | The new Magnet System is saved with status `In Stock`. The record appears in the 'Magnet Systems' list. A creation history entry is written. |
| 6 | Open the Magnet System record and trigger the 'Check Out' action. | The Checkout confirmation dialog is displayed. |
| 7 | Confirm the checkout. | The Magnet System status changes to `Checked Out`. A checkout history entry is written including the current user name and timestamp. |
| 8 | Navigate to the 'Hardware Configuration' page for the target tool module. | The hardware configuration for the module loads and shows the Magnet System role slot as empty. |
| 9 | Trigger the 'Install Magnet System' action on the empty role slot. | The Magnet System selection dialog opens. Only Magnet Systems with status `Checked Out` that are not currently installed are listed. |
| 10 | Select the checked-out Magnet System and confirm the installation. | The Magnet System status changes to `In Use`. The 'Hardware Configuration' page displays the Magnet System in the installed role slot. |
| 11 | Navigate to the 'Logbook' for the tool and apply the Magnet System filter. | The Logbook displays a Magnet System installation entry for this event. The entry includes the Magnet System identifier and timestamp. |
| 12 | Open the Magnet System record and navigate to the 'History' view. | The history view loads and contains entries for: Create, Checkout, and Install. Each entry includes the correct user, timestamp, and event description. |
| 13 | Return to 'Hardware Configuration' and trigger the Export action. | The export file is generated and is available for download. |
| 14 | Open the exported file and locate the installed Magnet System entry. | The Magnet System appears in the export file in the format `[Magnet System Number] ([Magnet System Type Article Number])`. No additional prototype variant code is present for a Standard type. |

## Expected Outcome
A Hardware Component is used as the source for a new Magnet System Type. A Magnet System is created from that type, checked out, and installed into a tool position. The Magnet System status progresses from `In Stock` to `Checked Out` to `In Use`. History entries for Create, Checkout, and Install are recorded. The tool Logbook contains the installation event. The Hardware Configuration export file reflects the installed Magnet System.
