# R10.2 Update for CR 286067 - Magnet Systems: Verify tester can view available Magnet Systems (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- At least one Magnet System record exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page. | The page loads. Existing Magnet System records are displayed. |
| 2 | Review the list of records. | Records are displayed with expected columns (Magnet System Number, Serial Number, Status, Magnet System Type, Location). |
| 3 | Verify the Status column values. | Displayed statuses are one of the four valid lifecycle values: `In Stock`, `In Use`, `In Inspection`, or `Retired`. |
| 4 | Apply a basic status filter (for example filter by `In Stock`). | The list updates to display only records with `In Stock` status. Records with other statuses are hidden. |

## Expected Outcome
The 'Magnet Systems' page loads and displays existing records with the correct lifecycle status values. Status filtering updates the displayed records to match the selected status. Only records matching the filter criteria are shown.
