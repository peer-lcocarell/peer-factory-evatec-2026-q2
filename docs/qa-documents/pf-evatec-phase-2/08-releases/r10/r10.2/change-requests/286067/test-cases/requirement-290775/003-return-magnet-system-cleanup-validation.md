# R10.2 Update for CR 286067 - Return Magnet System: Verify Location is cleared and status returns to In Stock after return from Checked Out (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `Checked Out` exists with a known Location value.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and select a Magnet System with status `Checked Out`. | The Magnet System record is visible. The Location field shows the associated tool name or user location. |
| 2 | Trigger the 'Return' action. | The Return confirmation dialog is displayed. |
| 3 | Confirm the return. | The return action completes. |
| 4 | Re-open the Magnet System record. | The Magnet System status is `In Stock`. The Location field is empty. |
| 5 | Open the Magnet System History view. | A Return history entry is present with the current user and timestamp. |

## Expected Outcome
After a Magnet System is returned from `Checked Out` status, the status changes to `In Stock` and the Location field is cleared (empty). A Return history entry is written recording the user and timestamp.
