# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can install a magnet system into an empty role slot in Tool Hardware Configuration (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View`, `HardwareConfiguration_Edit`, and `Logbook_View` permissions.
- A tool module has an empty Magnet System role slot in its Hardware Configuration.
- At least one Magnet System with status `Checked Out` exists and is not currently installed in any tool.
- The Logbook for the target tool is accessible.
- Assumption A02 applies (see assumptions.md): Install is a distinct action from Change.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module. | Configuration loads and displays the Magnet System role slot as empty. |
| 2 | Trigger the 'Install Magnet System' action on the empty role slot. | The Magnet System selection dialog opens. Only Magnet Systems with status `Checked Out` that are not already installed are displayed. |
| 3 | Select a valid `Checked Out` Magnet System and confirm the installation. | The installation action completes without error. |
| 4 | Verify the Hardware Configuration page. | The selected Magnet System is displayed in the role slot as the installed item. The Hardware Configuration version number increments by one. |
| 5 | Open the Magnet System record and review the status and History. | The Magnet System status is `In Use`. A new history entry is present for the Install event, including the tool name, user, and timestamp. |
| 6 | Navigate to the 'Logbook' for the target tool and apply the Magnet System filter. | A new Logbook entry is present for the install event. The entry includes the Magnet System identifier, the install action, the current user, and the timestamp. The entry count has increased by one compared to the baseline. |

## Expected Outcome
A checked-out Magnet System can be installed into an empty role slot in Hardware Configuration. After installation, the Magnet System status changes to `In Use`, the Hardware Configuration version increments, a history entry records the install event, and exactly one Logbook entry is generated for the install event containing the Magnet System identifier, action, user, and timestamp.
