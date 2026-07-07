# R10.2 Update for CR 286067 - Change Magnet System: Verify a Logbook entry is generated in the tool Logbook when a magnet system is installed (Integration)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View`, `HardwareConfiguration_Edit`, and `Logbook_View` permissions.
- A tool module has an empty Magnet System role slot in its Hardware Configuration.
- At least one Magnet System with status `Checked Out` exists.
- The Logbook for the target tool is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Note the current number of entries in the Logbook for the target tool. | Baseline entry count is captured. |
| 2 | Open the 'Hardware Configuration' page for the target tool module and install the `Checked Out` Magnet System. | Installation completes. Magnet System status changes to `In Use`. |
| 3 | Navigate to the 'Logbook' for the target tool. | The Logbook page loads. |
| 4 | Review the Logbook entries and apply the Magnet System filter. | A new Logbook entry is present for the Magnet System install event. The entry count has increased by one compared to the baseline. |
| 5 | Verify the Logbook entry details. | The entry includes the Magnet System identifier, the install action description, the current user, and the timestamp. |

## Expected Outcome
Installing a Magnet System into a tool Hardware Configuration generates exactly one Logbook entry for the install event. The entry contains the Magnet System identifier, action, user, and timestamp. The Magnet System filter in the Logbook displays this entry.
