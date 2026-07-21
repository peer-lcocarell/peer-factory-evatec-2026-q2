# R10.2 Update for CR 286067 - Return Magnet System: Cancel return keeps Magnet System in Checked Out state (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `Checked Out` exists with a known Location value.
- The selected Magnet System has `Checked Out By` and `Checked Out Timestamp` populated.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list and select a Magnet System with status `Checked Out`. | The record is selected. The Return action is available. |
| 2 | Trigger the 'Return' action. | The Return confirmation dialog is displayed with Confirm and Cancel options. |
| 3 | Select Cancel in the Return confirmation dialog. | The dialog closes. No return is executed. |
| 4 | Re-open the Magnet System record. | The Magnet System status is still `Checked Out`. The Location field still contains the original value. `Checked Out By` is unchanged. `Checked Out Timestamp` is unchanged. |
| 5 | Open the Magnet System History view. | No new Return history entry is created for this action. |

## Expected Outcome
Canceling the Return confirmation does not change Magnet System data. The record stays `Checked Out`, checkout data remains unchanged, and no Return history entry is added.
