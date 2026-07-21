---
TestCaseId: 293927
PlanId: 291616
SuiteId: 292283
---

# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can cancel Change Magnet System without modifying Hardware Configuration (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool module has a Magnet System currently installed in its Hardware Configuration.
- At least one replacement Magnet System with status `Checked Out` exists.
- The Hardware Configuration version number is noted.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module and select 'Change Magnet System'. | The selection dialog opens. |
| 2 | Select Cancel in the selection dialog without choosing a replacement. | The dialog closes and the original Magnet System remains installed with no version change. |
| 3 | Select 'Change Magnet System' again, choose a `Checked Out` replacement, and continue to the confirmation screen. | The confirmation screen opens and shows the selected Magnet System details with the optional Comment field. |
| 4 | Select Cancel in the confirmation screen. | The dialog closes and no change is applied to Hardware Configuration. |
| 5 | Refresh and reopen Hardware Configuration, then open both Magnet System records and the tool Logbook. | The version remains unchanged, the original Magnet System remains `In Use`, the replacement remains `Checked Out`, and no new history or logbook entries are present. |

## Expected Outcome
Cancelling from either the selection dialog or the confirmation screen leaves the Hardware Configuration, Magnet System statuses, Magnet System histories, and tool Logbook completely unchanged.
