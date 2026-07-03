# R10.2 Update for CR 286067 - Magnet System Type History: Verify history records are created when magnet system type changes occur (Audit)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290762
Requirement: Magnet System Type History (Magnet System Types)

## Preconditions
- User is signed in with permission to view and edit Magnet System Types and view history.
- A Magnet System Type exists that can be edited.
- Magnet System Type History view is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Note current history entries for the target Magnet System Type. | Existing history baseline is captured. |
| 2 | Edit the Magnet System Type (for example update Application or Description) and save. | Save succeeds. |
| 3 | Open the Magnet System Type History view. | History view loads successfully. |
| 4 | Verify new history entry. | A new history record reflects the change with user and timestamp information. |

## Expected Outcome
Every change to a Magnet System Type generates an accurate history entry for audit purposes.
