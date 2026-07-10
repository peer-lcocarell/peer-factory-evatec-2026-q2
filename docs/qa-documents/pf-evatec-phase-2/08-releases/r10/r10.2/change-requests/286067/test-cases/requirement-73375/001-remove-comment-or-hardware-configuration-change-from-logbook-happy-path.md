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
| 2 | Select a logbook entry that contains a removable comment and record the comment text, author, and timestamp. | The exact target comment is identified and documented for validation. |
| 3 | Trigger the Remove action for the selected comment. | A confirmation dialog is displayed. |
| 4 | Cancel the removal. | The confirmation dialog is closed and the selected comment remains visible. |
| 5 | Trigger the Remove action for the same comment again. | A confirmation dialog is displayed again. |
| 6 | Confirm the removal. | Only the selected comment is removed from the entry and no other entries are modified. |
| 7 | Refresh the 'Logbook' view. | The removed comment remains absent and unrelated entries remain unchanged. |
| 8 | Close the Logbook page and reopen the same tool logbook. | The removed comment is still not displayed and entry consistency is preserved. |

## Expected Outcome
A selected removable comment can be removed with explicit cancel/confirm behavior validation. The exact removed comment remains absent after refresh and reopen, and no unrelated logbook records are modified.
