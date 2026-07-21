# R10.2 Update for CR 286067 - View Magnet System: Verify tester can view Magnet System details (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- At least one Magnet System exists in a non-retired status.
- A target Magnet System exists with known values for Serial Number, Magnet System Number, Magnet System Type, Status, Last Inspection Date, and Comment.
- For the selected target record, expected Location behavior is known before execution:
	- Status `In Use`: Location is populated.
	- Status other than `In Use`: Location is empty.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | Records are displayed. |
| 2 | Select the prepared target Magnet System record from the list. | The selected row is highlighted and the View action is available. |
| 3 | Open the View page for the selected record. | The View screen loads without error and shows the selected Magnet System number in the header or primary identifier area. |
| 4 | Read the Serial Number, Magnet System Number, and Magnet System Type fields. | Values match the prepared baseline for the selected record. |
| 5 | Read the Status and Last Inspection Date fields. | Values match the prepared baseline for the selected record. |
| 6 | Read the Comment field. | The field value matches the prepared baseline for the selected record. |
| 7 | Read the Location field for the currently displayed status. | If status is `In Use`, Location is populated with the assigned location. If status is not `In Use`, Location is empty. |
| 8 | Select the Copy URL action. | A URL in the format `<path>/magnet systems/view/<magnet system number>` is copied to the clipboard and includes the current Magnet System identifier. |
| 9 | Select the Print Label action. | The print label flow opens for the currently viewed Magnet System. |
| 10 | Select Back. | The previous page is displayed and the user returns to the Magnet Systems context. |

## Expected Outcome
The View page for a Magnet System loads and displays all required fields with values matching the prepared baseline for the selected record. Location visibility behavior is correct for the displayed status. Copy URL returns a record-specific view URL, Print Label opens the label flow for the current record, and Back returns the user to the prior Magnet Systems context.
