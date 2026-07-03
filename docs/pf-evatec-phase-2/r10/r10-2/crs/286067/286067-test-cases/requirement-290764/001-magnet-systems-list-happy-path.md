# R10.2 Update for CR 286067 - Magnet Systems: Verify tester can view available magnet systems (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290764
Requirement: Magnet Systems (Magnet Systems)

## Preconditions
- User is signed in with permission to view Magnet Systems.
- At least one Magnet System record exists.
- Magnet Systems page is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Magnet Systems page. | Page loads successfully. |
| 2 | Review the list of Magnet Systems. | Records are displayed with expected columns. |
| 3 | Verify status column values. | Displayed statuses match expected lifecycle values (In Stock / In Use / In Inspection / Retired). |
| 4 | Apply a basic filter (for example by status). | List updates according to filter. |

## Expected Outcome
Tester can view available Magnet Systems with correct data and functional list behavior.
