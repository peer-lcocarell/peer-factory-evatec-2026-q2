# R10.2 Update for CR 286067 - Remove Comment or Hardware Configuration Change from Logbook: Verify removed logbook entry no longer appears in history view (Regression)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73375
Requirement: Remove Comment or Hardware Configuration Change from Logbook (Logbook)

## Preconditions
- User is signed in with permissions to view and modify Logbook entries.
- Historical logbook entries exist for a tool.
- History view for the same tool is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Logbook for a tool and identify a removable hardware configuration change entry. | Entry is identified in the logbook list. |
| 2 | Remove the selected logbook entry and confirm. | Entry is removed from Logbook view. |
| 3 | Navigate to the tool history view. | History view loads successfully. |
| 4 | Verify the removed entry is no longer listed. | Removed entry does not appear in history view. |

## Expected Outcome
Removed logbook entries are also removed from history views without impacting unrelated records.
