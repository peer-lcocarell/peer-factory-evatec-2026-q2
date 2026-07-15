# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify tester can set a Magnet System Type as the standard type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- Multiple Magnet System Types exist.
- The 'Define as Standard' action is accessible from the 'Magnet System Types' area.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list. | Records are displayed. |
| 2 | Select a Magnet System Type. | The 'Define as Standard' action is available. |
| 3 | Trigger the 'Define as Standard' action and confirm. | The action completes. |
| 4 | Refresh the list. | The selected record is marked as Standard. |
| 5 | Open the Magnet System Type History view. | A history entry is present for the Define as Standard event with the current user and timestamp. |

## Expected Outcome
The selected Magnet System Type is marked as Standard after the action completes. The Standard flag is visible in the list. A history entry is written for the event.
