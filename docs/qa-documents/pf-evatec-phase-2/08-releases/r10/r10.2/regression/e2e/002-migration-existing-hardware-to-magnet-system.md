# R10.2 Update for CR 286067 - Migration: Verify an existing Hardware Component that is already installed can be converted to a Magnet System and remain traceable (Migration Scenario)

## Requirement
CR: 286067
Ticket: 35008
Requirement IDs: 290757, 290765, 290777, 290771, 73354
Requirement: Migration of Existing Hardware Component to Magnet System (Cross-Cutting Migration)

## Preconditions
- User is signed in with `MagnetSystemType_Edit`, `MagnetSystem_Edit`, `HardwareConfiguration_Edit`, `ManageHardware_Edit`, and `ManageHardware_View` permissions.
- A Hardware Component exists in the system that is currently installed in a tool module under a non-Magnet System role.
- The Hardware Component has existing Logbook entries and history records.
- The existing role is a legacy Magnet System-type role (not the new Magnet System role introduced in R10.2).
- The 'Magnet System Types' page, 'Magnet Systems' page, 'Hardware Configuration' page, and 'Manage Hardware' configuration are all accessible.
- Assumption A06 applies (see assumptions.md): migration is manual — delete legacy role, create new role, recreate associations.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to 'Manage Hardware' and open the Logbook configuration for the affected module type. | The Logbook configuration for the module type is displayed with the legacy Magnet System role visible. |
| 2 | Note all existing serial numbers and associations linked to the legacy role. | Existing associations and serial numbers are captured as a baseline. |
| 3 | Delete the legacy Magnet System role from the Logbook configuration. | The legacy role is removed. The 'Hardware Configuration' page for the tool no longer shows the legacy role slot. |
| 4 | Add a new role of type 'Magnet System' to the Logbook configuration. | The new role appears in the Logbook configuration. The 'Requires Serial Number' setting is set to `Yes` and is not editable. |
| 5 | Save the Logbook configuration changes. | Save completes without validation errors. The new Magnet System role is persisted. |
| 6 | Navigate to the 'Magnet System Types' page and create a new Magnet System Type using the ERP article number of the previously installed Hardware Component. | The Magnet System Type is created successfully and appears in the 'Magnet System Types' list. |
| 7 | Navigate to the 'Magnet Systems' page and create a new Magnet System using the original serial number of the previously installed hardware. | The Magnet System is created with status `In Stock`. The record is visible in the 'Magnet Systems' list. |
| 8 | Check out the newly created Magnet System. | The Magnet System status changes to `Checked Out`. |
| 9 | Navigate to 'Hardware Configuration' for the affected tool module and install the checked-out Magnet System into the new role slot. | The Magnet System is installed. The status changes to `In Use`. The Logbook records an install entry for the new Magnet System. |
| 10 | Verify the Magnet System History shows the full lifecycle. | History entries are present for Create, Checkout, and Install. The serial number matches the original hardware serial number. |

## Expected Outcome
A legacy hardware component role can be manually migrated to the new Magnet System model by removing the legacy role, creating the new role type, creating a Magnet System with the original serial number, and reinstalling it. The new Magnet System is traceable through history and the Logbook after migration. No data from the original Logbook and hardware configuration is corrupted during the process.
