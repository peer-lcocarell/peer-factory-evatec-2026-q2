# R10.2 Update for CR 286067 - Remove Comment or Hardware Configuration Change from Logbook: Verify removed logbook entry no longer appears in history view (Regression)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73375
Requirement: Remove Comment or Hardware Configuration Change from Logbook (Logbook)

## Preconditions
- User is signed in with `Logbook_View` and `Logbook_Edit` permissions.
- Historical logbook entries exist for a tool.
- The history view for the same tool is accessible.
- At least one removable hardware change entry is linked to a Magnet System install or uninstall history event.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Logbook' for a tool and identify a removable hardware configuration change entry. | The entry is identified in the logbook list. |
| 2 | Remove the selected logbook entry and confirm. | The entry is removed from the 'Logbook' view. |
| 3 | Navigate to the tool history view. | The history view loads. |
| 4 | Verify the removed entry is no longer listed. | The removed entry does not appear in the history view. |
| 5 | Verify linked Magnet System install or uninstall history behavior. | Related linked history entries are removed from the Logbook according to requirement rules. Unrelated records are not affected. |

## Expected Outcome
Removed Logbook entries and linked history artifacts are handled consistently. The removed entry is absent from both the Logbook view and the history view. Unrelated Logbook records and Magnet System history entries are not modified.
