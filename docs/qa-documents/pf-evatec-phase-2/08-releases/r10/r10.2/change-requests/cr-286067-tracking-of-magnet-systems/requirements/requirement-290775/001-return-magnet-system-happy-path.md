# R10.2 Update for CR 286067 - Return Magnet System: Verify tester can return a Magnet System to available inventory (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `Checked Out` exists with a known Location value.
- The selected Magnet System has `Checked Out By` and `Checked Out Timestamp` populated before return.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list and select a Magnet System with status `Checked Out`. | The record is selected. The Return action is available. |
| 2 | Trigger the 'Return' action. | The Return confirmation dialog is displayed. |
| 3 | Confirm the return. | The return completes. |
| 4 | Re-open the Magnet System record. | The Magnet System status is `In Stock`. The Location field is empty. `Checked Out By` is empty. `Checked Out Timestamp` is empty. |
| 5 | Open the Magnet System History view. | A Return history entry is present with the current user and timestamp. The current detail no longer shows checked-out user or tool context. |

## Expected Outcome
A `Checked Out` Magnet System can be returned to inventory. After return, the status changes to `In Stock`, the Location field is empty, `Checked Out By` and `Checked Out Timestamp` are cleared, and a Return history entry is written with the user and timestamp.
