---
TestCaseId: 293169
PlanId: 291616
SuiteId: 292283
---

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

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module. | Configuration loads and displays the installed Magnet System in the role slot. |
| 2 | Trigger the 'Uninstall Magnet System' action on the installed role slot. | An uninstall confirmation dialog is displayed. |
| 3 | Confirm the uninstall action. | The uninstall completes, a success indication is shown, and no validation or system error is displayed. |
| 4 | Refresh the Hardware Configuration page, then reopen it for the same module. | The role slot is empty, the previously installed Magnet System is no longer shown, and the version is incremented by one and remains incremented after reopen. |
| 5 | Open the previously installed Magnet System record. | The status is `Checked Out`, the Location field is empty, and a new Uninstall history entry is shown with tool, user, and timestamp. |
| 6 | Open the tool Logbook and apply the Magnet System filter. | One new uninstall event is present with the Magnet System identifier, serial number, actor, and timestamp. |

## Expected Outcome
An installed Magnet System can be uninstalled from a Hardware Configuration role slot. The change persists after refresh and reopen. After uninstall, the Magnet System status returns to `Checked Out`, the Hardware Configuration version increments, the role slot is empty, and both the Magnet System History and the tool Logbook contain the uninstall event.
