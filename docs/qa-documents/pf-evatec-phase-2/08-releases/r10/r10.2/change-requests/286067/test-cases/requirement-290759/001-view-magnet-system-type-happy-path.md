# R10.2 Update for CR 286067 - View Magnet System Type: Verify tester can view details of a Magnet System Type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290759
Requirement: View Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` permission.
- At least one Magnet System Type exists.
- The 'Magnet System Types' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list. | Existing records are displayed. |
| 2 | Select an existing Magnet System Type. | The View action is available. |
| 3 | Open the View page for the selected record. | The View screen loads with the detailed record information. |
| 4 | Verify the displayed fields. | Article Number, Name, ERP Status, Source Type, FlexiCat Type, Applications, and Description fields display the saved values. |

## Expected Outcome
The View page for a Magnet System Type loads and displays all stored field values. Displayed data matches the values saved when the record was created or last edited.
