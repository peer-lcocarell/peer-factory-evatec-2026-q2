# R10.2 Update for CR 286067 - View Magnet System: Verify inspection notification is displayed when a Magnet System requires inspection

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A Magnet System exists with an inspection due or overdue state.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | Records are displayed. |
| 2 | Open the View page for a Magnet System that requires inspection. | The View screen loads. An inspection notification is displayed on the screen. |
| 3 | Open the View page for a Magnet System that does not require inspection. | The View screen loads. No inspection notification is displayed. |

## Expected Outcome
An inspection notification is displayed on the View screen when a Magnet System requires inspection. No notification is shown when inspection is not required.
