# R10.2 Update for CR 286067 - Return Magnet System: Verify tester can return a magnet system to available inventory (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- User is signed in with permission to return Magnet Systems.
- At least one Magnet System exists in a returnable state (for example In Use or In Inspection).
- Magnet Systems list is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Magnet Systems list and select a returnable record. | Record is selected. |
| 2 | Trigger the Return action. | Return confirmation prompt is displayed. |
| 3 | Confirm the return. | Record status transitions back to In Stock. |
| 4 | Verify a history entry is created. | Magnet System History reflects the return event. |

## Expected Outcome
Tester can return a Magnet System to available inventory and lifecycle status and history update correctly.
