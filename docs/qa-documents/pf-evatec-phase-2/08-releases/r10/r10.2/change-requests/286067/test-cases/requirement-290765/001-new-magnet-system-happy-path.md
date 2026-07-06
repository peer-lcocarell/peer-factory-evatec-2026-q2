# R10.2 Update for CR 286067 - New Magnet System: Verify tester can create a new magnet system using a valid magnet system type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System (Magnet Systems)

## Preconditions
- User is signed in with permission to create Magnet Systems.
- At least one valid Magnet System Type exists.
- Magnet Systems page is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Magnet Systems and select New. | New Magnet System screen is displayed. |
| 2 | Enter a unique Serial Number and Last Inspection Date. | Required fields accept valid input. |
| 3 | Select a valid Magnet System Type. | Related fields populate. |
| 4 | Save the new Magnet System. | Save succeeds and record appears in Magnet Systems list with status In Stock. |

## Expected Outcome
Tester can create a new Magnet System successfully using a valid Magnet System Type.
