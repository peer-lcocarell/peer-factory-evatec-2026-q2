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
| 1 | Open the View page for a Magnet System with status `In Stock`. | The Location field is empty. Status displays `In Stock`. The Checked Out To, Checked Out At, Retire Date, and Reason fields are not displayed. |
| 2 | Open the View page for a Magnet System with status `In Use` (checked out). | The Location field displays the name of the tool where the Magnet System is installed. Status displays `In Use`. The Checked Out To field displays the name of the user who checked it out. The Checked Out At field displays the checkout timestamp. |
| 3 | Open the View page for a Magnet System with status `In Inspection`. | The Location field is empty. Status displays `In Inspection`. The Checked Out To, Checked Out At, Retire Date, and Reason fields are not displayed. |
| 4 | Open the View page for a Magnet System with status `Retired`. | The Location field is empty. Status displays `Retired`. The Retire Date field displays the date of retirement. The Reason field displays the retirement reason. |

## Expected Outcome
The Location field is populated only when the Magnet System is `In Use`. Checked Out To and Checked Out At fields are displayed only when the status is `In Use`. Retire Date and Reason are displayed only when the status is `Retired`. No conditional fields appear for statuses where they are not applicable.
