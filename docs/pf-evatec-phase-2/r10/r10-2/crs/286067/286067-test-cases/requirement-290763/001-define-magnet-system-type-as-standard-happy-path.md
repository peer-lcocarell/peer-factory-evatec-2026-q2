# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify tester can set a magnet system type as the standard type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with permission to define standard Magnet System Types.
- Multiple Magnet System Types exist in the system.
- Standard definition action is accessible from the Magnet System Types area.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Magnet System Types list. | Records are displayed. |
| 2 | Select a target Magnet System Type. | Define as Standard action is available. |
| 3 | Set the record as the Standard Magnet System Type and confirm. | Action completes successfully. |
| 4 | Refresh the list. | Selected record is marked as Standard. |

## Expected Outcome
Tester can define a Magnet System Type as the Standard type and it is reflected in the list.
