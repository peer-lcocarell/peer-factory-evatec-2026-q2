# R10.2 Update for CR 286067 - Retire Magnet System: Verify tester can retire an active magnet system (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290772
Requirement: Retire Magnet System (Magnet Systems)

## Preconditions
- User is signed in with permission to retire Magnet Systems.
- At least one Magnet System in a retirable state (for example In Stock or In Inspection) exists.
- Magnet Systems list is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Magnet Systems list and select a retirable record. | Record is selected. |
| 2 | Trigger the Retire action. | Retire confirmation prompt is displayed. |
| 3 | Confirm retirement. | Record status changes to Retired. |
| 4 | Verify a history entry is created. | Magnet System History reflects the retirement event. |

## Expected Outcome
Tester can retire an active Magnet System and the status and history update accordingly.
