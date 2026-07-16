# 286067 Magnet System Types - Prevent Edit Without Edit Permission

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290759
Requirement: View Magnet System Type (Magnet System Types)

## Tags
- R10.2

## Preconditions
- User is signed in with `MagnetSystemTypes_View` permission only.
- User does not have `MagnetSystemTypes_Edit` permission.
- At least one active Magnet System Type record exists.
- The 'Magnet System Types' page is accessible from the application menu.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The list page loads successfully and displays existing Magnet System Type records. |
| 2 | Select a known existing Magnet System Type record. | The record is selectable and the View action is available. |
| 3 | Open the View page for the selected record. | The View page opens without error and displays the Magnet System Type details. |
| 4 | Inspect the View page for an Edit action or button. | No Edit action or button is visible on the page. |
| 5 | Attempt to navigate directly to the Edit URL for the record if known. | Access is denied or the user is redirected. An appropriate error or access-denied message is displayed. |

## Expected Outcome
A user with `MagnetSystemTypes_View` only cannot access the Edit action from the View page. No Edit button or control is rendered. Direct URL navigation to the Edit page is blocked and returns an access-denied response.
