# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can uninstall a magnet system from Tool Hardware Configuration (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool module has a Magnet System currently installed in its Hardware Configuration.
- The Magnet System is in `In Use` status.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module. | Configuration loads and displays the installed Magnet System in the role slot. |
| 2 | Trigger the 'Uninstall Magnet System' action on the installed role slot. | An uninstall confirmation dialog is displayed. |
| 3 | Confirm the uninstall action. | The uninstall completes without error. The Hardware Configuration version number increments by one. |
| 4 | Verify the Hardware Configuration page. | The Magnet System role slot is empty. The previously installed Magnet System is no longer displayed in the slot. |
| 5 | Open the Magnet System record and review the status and History. | The Magnet System status is `Checked Out`. A new history entry is present for the Uninstall event, including the tool name, user, and timestamp. |
| 6 | Navigate to the 'Logbook' for the tool. | A Logbook entry is present for the Magnet System uninstall event with the Magnet System identifier and timestamp. |

## Expected Outcome
An installed Magnet System can be uninstalled from a Hardware Configuration role slot. After uninstall, the Magnet System status returns to `Checked Out`, the Hardware Configuration version increments, the role slot is empty, and both the Magnet System History and the tool Logbook contain the uninstall event.
