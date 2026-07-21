---
TestCaseId: 293165
PlanId: 291616
SuiteId: 292283
---

# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can replace an installed Magnet System within Tool Hardware Configuration (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool module has a Magnet System currently installed in its Hardware Configuration.
- At least one replacement Magnet System with status `Checked Out` exists and is not currently installed in any tool.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module and note the current Hardware Configuration version. | The page loads with no error message, shows the currently installed Magnet System in the role slot, and shows the current version value. |
| 2 | Select 'Change Magnet System'. | The Change Magnet System dialog opens and lists only Magnet Systems with status `Checked Out` that are eligible for replacement. |
| 3 | Select a `Checked Out` Magnet System and select Next. | The confirmation screen shows the selected Magnet System details and an optional Comment field with a 250-character limit. |
| 4 | Enter an optional comment and select Confirm. | The dialog closes, the page shows a success indication, and no validation or system error message is shown. |
| 5 | Refresh the 'Hardware Configuration' page and reopen the same module. | The replacement Magnet System is shown in the role slot as an `MS####` link, the previous Magnet System is not shown, and the version is incremented by one after save and remains incremented after reopen. |
| 6 | Open the previously installed Magnet System record and the newly installed Magnet System record. | The previous Magnet System shows status `Checked Out`, empty Location, and an `uninstalled` history entry with tool, user, and timestamp. The new Magnet System shows status `In Use`, Location that matches the target tool and module, and an `installed` history entry with tool, user, and timestamp. |

## Expected Outcome
The Change Magnet System action replaces the installed Magnet System with the selected `Checked Out` replacement after confirmation. The update persists after refresh and reopen. The previously installed Magnet System returns to `Checked Out` with empty Location and an `uninstalled` history entry. The newly installed Magnet System changes to `In Use` with updated Location and an `installed` history entry. The Hardware Configuration version increments and the role slot displays an `MS####` link to the Magnet System details.
