# R10.2 Update for CR 286067 - Retire Magnet System: Verify tester can retire an active Magnet System (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290772
Requirement: Retire Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystems_Remove` permissions.
- At least one Magnet System with status `In Stock` exists.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list and select a Magnet System with status `In Stock`. | The record is selected. The Retire action is available. |
| 2 | Trigger the 'Retire' action. | The Retire confirmation dialog is displayed with a mandatory reason field. |
| 3 | Select Cancel from the Retire confirmation dialog. | The dialog closes. The Magnet System remains unchanged. The status remains `In Stock`. No history entry is created. |
| 4 | Trigger the 'Retire' action again. | The Retire confirmation dialog is displayed. |
| 5 | Enter a valid retirement reason and confirm. | The retirement completes. The Magnet System status changes to `Retired`. The Location field is empty. |
| 6 | Verify the record in the list. | The status column displays `Retired` for the retired Magnet System. |
| 7 | Open the retired Magnet System record. | The status is `Retired`. The retirement reason is displayed. The retirement user is recorded. The retirement timestamp is displayed. |
| 8 | Review the Inspection Required field. | The Inspection Required flag is cleared. |
| 9 | Open the Magnet System History view. | A retirement history entry is present with the retirement reason, the current user, and the timestamp. |

## Expected Outcome
A Magnet System in `In Stock` status can be retired by providing a mandatory reason. Cancelling the dialog leaves the record unchanged. After confirmed retirement, the status changes to `Retired`, the Location field is empty, the Inspection Required flag is cleared, and a history entry records the retirement reason, user, and timestamp.
