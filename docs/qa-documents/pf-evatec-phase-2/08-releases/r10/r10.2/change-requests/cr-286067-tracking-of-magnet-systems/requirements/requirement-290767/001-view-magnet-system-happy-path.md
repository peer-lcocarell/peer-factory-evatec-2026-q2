# R10.2 Update for CR 286067 - View Magnet System: Verify tester can view Magnet System details (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- At least one Magnet System exists.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | Records are displayed. |
| 2 | Select a Magnet System record. | The View action is available. |
| 3 | Open the View page. | The View screen loads with the Magnet System details. |
| 4 | Verify displayed fields. | Serial Number, Magnet System Number, Magnet System Type, Status, Last Inspection Date, Location, and Comment fields display the saved values. The Location field is populated only if the status is `In Use`. |
| 5 | Select the Copy URL action. | The URL in the format `<path>/magnet systems/view/<magnet system number>` is copied to the clipboard. |
| 6 | Select the Print Label action. | The label print dialog or print preview opens for the Magnet System. |
| 7 | Select Back. | The user is returned to the previous page. |

## Expected Outcome
The View page for a Magnet System loads and displays all stored field values. Displayed data matches the values saved when the record was created or last edited. The Location field is empty for statuses other than `In Use`. The Copy URL action copies the correct URL to the clipboard. The Print Label action opens the label print flow. Back navigation returns the user to the previous page.
