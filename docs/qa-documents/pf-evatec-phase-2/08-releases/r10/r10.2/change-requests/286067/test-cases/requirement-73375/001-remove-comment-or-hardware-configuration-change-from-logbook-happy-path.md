# R10.2 Update for CR 286067 - Remove Comment or Hardware Configuration Change from Logbook: Verify tester can remove a logbook entry comment (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73375
Requirement: Remove Comment or Hardware Configuration Change from Logbook (Logbook)

## Preconditions
- User is signed in with `Logbook_View` and `Logbook_Edit` permissions.
- A tool with Logbook entries containing removable comments exists.
- The 'Logbook' page for the target tool is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Logbook' page for a tool with existing entries. | Logbook entries are displayed. |
| 2 | Select a logbook entry that contains a removable comment. | The entry is selected and actions become available. |
| 3 | Trigger the Remove action on the comment and confirm. | The confirmation dialog is displayed. |
| 4 | Confirm the removal. | The comment is removed from the entry. |
| 5 | Refresh the 'Logbook' view. | The entry is displayed without the removed comment. No other entries are affected. |

## Expected Outcome
A logbook entry comment can be removed and the removal persists on page refresh. No other logbook entries are modified.
