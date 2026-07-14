# 286067 Magnet System Types - View Existing Magnet System Type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290759
Requirement: View Magnet System Type (Magnet System Types)

## Tags
- R10.2

## Preconditions
- User is signed in with `MagnetSystemType_View` permission.
- At least one active Magnet System Type record exists with known field values.
- The 'Magnet System Types' page is accessible from the application menu.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The list page loads successfully and displays existing Magnet System Type records. |
| 2 | Select a known existing Magnet System Type record. | The selected row is highlighted and the View action is enabled for the record. |
| 3 | Open the View page for the selected record. | The View page opens without error and displays the selected Magnet System Type details. |
| 4 | Verify the displayed field values against the known record data. | All visible fields are populated correctly and match the saved values for the selected record. |
| 5 | Verify read-only behavior on the View page. | Fields are non-editable, no Save action is available, and no unexpected validation or system error is shown. |


## Expected Outcome
The tester can open the View page for an existing Magnet System Type and review complete, accurate record details. The displayed values match the stored data, the page behaves as read-only, and the record is presented without validation or system errors.
