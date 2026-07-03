# R10.2 Update for CR 286067 - Retire Magnet System: Verify retired magnet systems cannot be selected for new assignments (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290772
Requirement: Retire Magnet System (Magnet Systems)

## Preconditions
- User is signed in with permissions to retire Magnet Systems and use Tool Hardware Configuration.
- At least one Magnet System with status Retired exists.
- A tool with a Magnet System role available for assignment exists.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Tool Hardware Configuration and start a Magnet System assignment action. | Magnet System selector is displayed. |
| 2 | Attempt to select a Retired Magnet System. | Retired records are not selectable in the assignment list. |
| 3 | Verify Retired records via a broader search. | Retired records display Retired status and remain non-assignable. |
| 4 | Cancel the assignment. | Configuration is unchanged. |

## Expected Outcome
Retired Magnet Systems cannot be selected for new assignments, preserving lifecycle integrity.
