# R10.2 Update for CR 286067 - Magnet Systems: Verify tester can view available Magnet Systems (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystems_View` permission.
- Magnet System records exist for statuses `In Stock`, `In Use`, `In Inspection`, and `Retired`.
- At least one Prototype Magnet System with variant code exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page. | The page loads. Existing Magnet System records are displayed. |
| 2 | Review list columns for at least one visible row. | Columns include Magnet System Number, Magnet System Type Name, Source Type, Location, Status, Checked Out By, Article Number, Serial Number, and Prototype with variant code where applicable. |
| 3 | Verify the Status values shown in the list. | Displayed statuses are valid lifecycle values `In Stock`, `In Use`, `In Inspection`, or `Retired`. |
| 4 | Apply status filter for `In Stock` and `In Inspection` at the same time. | Only records with status `In Stock` or `In Inspection` are shown. Records in `In Use` and `Retired` are hidden. |
| 5 | Clear status filters. | List returns to the prior dataset with full status distribution for the current active or all toggle state. |

## Expected Outcome
The 'Magnet Systems' page shows required list columns and valid lifecycle statuses for each record. Multi-value status filtering works correctly and returns only rows that match selected status values.
