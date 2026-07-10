# R10.2 Update for CR 286067 - Remove Comment or Hardware Configuration Change from Logbook: Verify removal permissions matrix (non-edit deny and tool-owner exception)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73375
Requirement: Remove Comment or Hardware Configuration Change from Logbook (Logbook)

## Preconditions
- User A exists with `Logbook_View` permission and without `Logbook_Edit` permission.
- User B is the owner of a target tool and has `Logbook_View` permission without `Logbook_Edit` permission.
- A removable comment and a removable hardware configuration change entry exist for User A validation.
- A removable comment authored by another user exists on the tool owned by User B.
- The 'Logbook' page is accessible for both scenarios.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as User A and open the 'Logbook' for the target tool. | Logbook entries are displayed with restricted removal actions for User A. |
| 2 | Select a removable comment entry and review available actions. | The Remove action is unavailable or disabled for the comment entry. |
| 3 | Select a removable hardware configuration change entry and review available actions. | The Remove action is unavailable or disabled for the hardware configuration change entry. |
| 4 | Refresh and reopen the Logbook as User A and re-check both entries. | Remove action remains unavailable or disabled after refresh and reopen. |
| 5 | Sign out and sign in as User B (tool owner without `Logbook_Edit`) and open the owned tool Logbook. | Logbook entries are displayed for the owned tool. |
| 6 | Locate a removable comment authored by another user and trigger Remove. | A confirmation dialog is displayed. |
| 7 | Confirm removal of the selected comment. | The selected comment is removed. |
| 8 | Refresh and reopen the owned tool Logbook. | The removed comment remains absent and unrelated entries remain unchanged. |

## Expected Outcome
Permissions are enforced consistently: non-edit users cannot remove comments or hardware configuration changes, while the tool-owner exception allows comment removal without `Logbook_Edit`. Results persist after refresh and reopen.
