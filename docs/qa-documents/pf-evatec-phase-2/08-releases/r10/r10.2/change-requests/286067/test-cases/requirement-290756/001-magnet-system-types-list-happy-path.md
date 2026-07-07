# R10.2 Update for CR 286067 - Magnet System Types: Verify tester can view the list of Magnet System Types (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` permission.
- At least one Magnet System Type record exists.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The page loads. Existing Magnet System Type records are displayed in the list. |
| 2 | Review the list of records. | Each record displays the expected identifying fields (Article Number, Name, ERP Status). |
| 3 | Verify visible columns. | The column headers are present and display correctly. |
| 4 | Apply a basic filter or sort. | The list updates to show only records matching the filter criteria or is ordered according to the sort selection. |

## Expected Outcome
The 'Magnet System Types' page loads and displays existing records. The list supports filtering and sorting. Applied filters reduce the displayed records to matching items. The page is accessible to users with `MagnetSystemType_View` permission.
