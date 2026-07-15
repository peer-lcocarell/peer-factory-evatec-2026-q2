# R10.2 Update for CR 286067 - Remove Comment or Hardware Configuration Change from Logbook: Attempt to remove a non-removable Logbook entry (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73375
Requirement: Remove Comment or Hardware Configuration Change from Logbook (Logbook)

## Preconditions
- User is signed in with `Logbook_View` and `Logbook_Edit` permissions.
- A tool with Logbook entries exists including non-removable entries (for example auto-generated system events or linked install/uninstall events that cannot be independently removed).
- The Logbook page for the target tool is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Logbook' for the target tool. | Logbook entries are displayed. |
| 2 | Locate a Logbook entry that is not removable (for example a system-generated event or a linked install entry). | The entry is visible in the Logbook. |
| 3 | Review the available actions for the non-removable entry. | A 'Remove' action is not present for this entry type, or the Remove action is disabled. |
| 4 | Attempt any available interaction that could remove the non-removable entry. | The non-removable entry cannot be removed and no removal confirmation is presented for that entry. |
| 5 | Refresh the Logbook page. | The same non-removable entry remains visible and unchanged. |
| 6 | Close and reopen the Logbook for the same tool. | The non-removable entry is still present and the Remove action remains unavailable or disabled. |

## Expected Outcome
Non-removable Logbook entries (system events, linked install/uninstall) cannot be removed. Remove action state remains unavailable/disabled and persistence checks after refresh and reopen confirm no state change.
