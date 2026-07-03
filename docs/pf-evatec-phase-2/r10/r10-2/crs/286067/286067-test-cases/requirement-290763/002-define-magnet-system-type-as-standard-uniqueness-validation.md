# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify only one standard magnet system type exists after update (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with permission to define standard Magnet System Types.
- One Magnet System Type is currently marked as Standard.
- Additional non-standard Magnet System Types exist.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Magnet System Types list and note the current Standard record. | Current Standard is identified. |
| 2 | Select a different Magnet System Type and set it as the Standard. | Action completes successfully. |
| 3 | Refresh the Magnet System Types list. | Only the newly selected record is marked as Standard. |
| 4 | Verify the previously Standard record. | Previous record is no longer marked as Standard. |

## Expected Outcome
Only one Magnet System Type is marked as Standard after an update, preserving uniqueness of the Standard flag.
