---
TestCaseId: 293168
PlanId: 291616
SuiteId: 292283
---

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

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module. | Configuration loads and displays the Magnet System role slot as empty. |
| 2 | Select 'Install Magnet System' on the empty role slot. | The selection dialog opens and lists only `Checked Out` Magnet Systems that are not already installed. |
| 3 | Select a valid `Checked Out` Magnet System and confirm the installation. | The selected Magnet System details are shown, the install completes, and no validation or system error is displayed. |
| 4 | Refresh the Hardware Configuration page, then reopen it for the same module. | The selected Magnet System is shown in the role slot, the version is incremented by one, and the same installed state persists after reopen. |
| 5 | Open the Magnet System record for the installed item. | The record shows status `In Use`, updated Location for the tool and module, and a new Install history entry with tool, user, and timestamp. |
| 6 | Open the tool 'Logbook' and apply the Magnet System filter. | One new install event is present with Magnet System identifier, serial number, action, user, and timestamp. The total entry count is increased by one from baseline. |

## Expected Outcome
A checked-out Magnet System can be installed into an empty role slot in Hardware Configuration. The installed state persists after refresh and reopen. After installation, the Magnet System status changes to `In Use`, the Hardware Configuration version increments, a history entry records the install event, and one new Logbook entry is generated for the install event with the Magnet System identifier, action, user, and timestamp.
