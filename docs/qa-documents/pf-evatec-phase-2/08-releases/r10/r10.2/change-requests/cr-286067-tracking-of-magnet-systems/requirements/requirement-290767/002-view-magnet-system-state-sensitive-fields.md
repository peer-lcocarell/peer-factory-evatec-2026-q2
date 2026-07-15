# R10.2 Update for CR 286067 - View Magnet System: Verify state-sensitive fields display correct values for each lifecycle status (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- Magnet Systems in all four statuses exist: `In Stock`, `In Use`, `In Inspection`, and `Retired`.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the View page for a Magnet System with status `In Stock`. | The Location field is empty. Status displays `In Stock`. |
| 2 | Open the View page for a Magnet System with status `In Use`. | The Location field displays the name of the tool where the Magnet System is installed. Status displays `In Use`. |
| 3 | Open the View page for a Magnet System with status `In Inspection`. | The Location field is empty. Status displays `In Inspection`. |
| 4 | Open the View page for a Magnet System with status `Retired`. | The Location field is empty. Status displays `Retired`. |

## Expected Outcome
The Location field on the Magnet System View screen is populated only when the Magnet System is `In Use`. For all other statuses (`In Stock`, `In Inspection`, `Retired`) the Location field is empty. The Status field accurately reflects the current lifecycle status for all four states.
