# R10.2 Update for CR 286067 - View Magnet System: Verify tester can view magnet system details (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- User is signed in with permission to view Magnet Systems.
- At least one Magnet System exists.
- Magnet Systems list is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Magnet Systems list. | Records are displayed. |
| 2 | Select a Magnet System record. | View action is available. |
| 3 | Open the View page. | View screen loads with details. |
| 4 | Verify displayed fields. | Fields (Serial Number, Magnet System Type, Status, Last Inspection Date, Location, Comment) reflect saved values. |

## Expected Outcome
Tester can view a Magnet System's details with accurate data.
