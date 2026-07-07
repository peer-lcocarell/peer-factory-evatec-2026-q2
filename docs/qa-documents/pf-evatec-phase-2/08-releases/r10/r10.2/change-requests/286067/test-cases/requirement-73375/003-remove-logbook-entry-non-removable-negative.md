# R10.2 Update for CR 286067 - Remove Comment or Hardware Configuration Change from Logbook: Attempt to remove a non-removable Logbook entry (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73375
Requirement: Remove Comment or Hardware Configuration Change from Logbook (Logbook)

## Preconditions
- User is signed in with `Logbook_View` and `Logbook_Edit` permissions.
- A tool with Logbook entries exists including both removable comments and non-removable entries (for example auto-generated system events or linked install/uninstall events that cannot be independently removed).
- The Logbook page for the target tool is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Logbook' for the target tool. | Logbook entries are displayed. |
| 2 | Locate a Logbook entry that is not removable (for example a system-generated event or a linked install entry). | The entry is visible in the Logbook. |
| 3 | Review the available actions for the non-removable entry. | A 'Remove' action is not present for this entry type, or the Remove action is disabled. |
| 4 | Locate a removable comment entry and trigger the Remove action. | A removal confirmation dialog is displayed. |
| 5 | Confirm the removal. | The comment entry is removed. The non-removable entry remains. |

## Expected Outcome
Non-removable Logbook entries (system events, linked install/uninstall) do not present a Remove action or display it as disabled. Removable comment entries can be removed normally. The removal of a comment does not affect non-removable entries.
