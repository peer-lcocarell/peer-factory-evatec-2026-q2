---
TestCaseId: 293925
PlanId: 291616
SuiteId: 292283
---

# R10.2 Update for CR 286067 - Change Magnet System: Verify hardware configuration history reflects the Magnet System change (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View`, `HardwareConfiguration_Edit`, `Logbook_View`, and `MagnetSystem_View` permissions.
- A tool module has a Magnet System installed that can be replaced.
- Hardware Configuration History, Logbook, and Magnet System History views are accessible.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Note the current Hardware Configuration version, Logbook entry count, and Magnet System History entries for both the installed and replacement Magnet Systems. | Baselines are captured. |
| 2 | Perform a Change Magnet System action from the 'Hardware Configuration' page. | The change completes and the Hardware Configuration version is incremented by one. |
| 3 | Open Hardware Configuration History for the tool. | A new Magnet System change entry is shown with both the previous and replacement Magnet System identifiers. |
| 4 | Open the tool 'Logbook' and apply the Magnet System filter category. | A Magnet System change event is shown with both Magnet System identifiers and the event timestamp. |
| 5 | Clear the Magnet System filter, then apply a non-Magnet System filter category. | Clearing restores all entry types. Applying a non-Magnet System filter hides Magnet System events and shows only the selected category. |
| 6 | Open Magnet System History for the newly installed Magnet System and the previously installed Magnet System. | The newly installed Magnet System has an Install entry and the previously installed Magnet System has an Uninstall entry for the same tool and change timeframe. |
| 7 | Refresh and reopen Hardware Configuration History and Logbook. | The same change and logbook entries remain present with unchanged values. |

## Expected Outcome
After a Magnet System change, the Hardware Configuration version increments. Hardware Configuration History shows a change entry with before and after Magnet System identifiers. The tool Logbook contains a corresponding Magnet System change entry, and filter behavior is correct when toggled between Magnet System and non-Magnet System categories. Both affected Magnet Systems have matching Install and Uninstall history entries that persist after refresh and reopen.
