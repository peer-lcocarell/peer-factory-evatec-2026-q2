# R10.2 Update for CR 286067 - Change Magnet System: Verify hardware configuration history reflects the Magnet System change (Regression)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View`, `HardwareConfiguration_Edit`, `Logbook_View`, and `MagnetSystem_View` permissions.
- A tool module has a Magnet System installed that can be replaced.
- Hardware Configuration History, Logbook, and Magnet System History views are accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Note the current Hardware Configuration version, Logbook entry count, and Magnet System History entries for both the installed and replacement Magnet Systems. | Baselines are captured. |
| 2 | Perform a Change Magnet System action within the 'Hardware Configuration' page. | Change completes. Hardware Configuration version increments by one. |
| 3 | Open the Hardware Configuration History for the tool. | A new history entry is present for the Magnet System change. The entry shows the previous Magnet System and the replacement Magnet System. |
| 4 | Open the 'Logbook' for the tool and apply the Magnet System filter. | A Logbook entry for the Magnet System change event is visible. The entry includes both Magnet System identifiers and the event timestamp. |
| 5 | Open the Magnet System History for the newly installed Magnet System. | An Install history entry is present for this tool and the current timestamp. |
| 6 | Open the Magnet System History for the previously installed Magnet System. | An Uninstall history entry is present for this tool and the current timestamp. |

## Expected Outcome
After a Magnet System change, the Hardware Configuration version increments. Hardware Configuration History shows a change entry with before and after Magnet System identifiers. The tool Logbook contains a corresponding Magnet System change entry. Both affected Magnet Systems have matching Install and Uninstall history entries.
