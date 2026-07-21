# R10.2 Update for CR 286067 - Remove Comment or Hardware Configuration Change from Logbook: Verify removed logbook entry no longer appears in history view

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
| 1 | Open the 'Logbook' for a tool and identify one removable hardware configuration change entry linked to a Magnet System install or uninstall history record. | The target removable entry and its linked Magnet System history record are identified. |
| 2 | Identify at least one unrelated Magnet System history record and one unrelated Logbook entry to use as controls. | Control records are identified for non-impact validation. |
| 3 | Remove the selected hardware configuration change entry and confirm. | The selected entry is removed from the 'Logbook' view. |
| 4 | Verify the selected entry is no longer visible in 'Logbook'. | The removed entry is absent from the logbook list. |
| 5 | Navigate to the tool history view and review the previously identified linked Magnet System history record. | The linked Magnet System history record reflects the required update/removal behavior. |
| 6 | Review the previously identified unrelated Magnet System history record and unrelated Logbook entry. | Unrelated Magnet System history and unrelated Logbook data remain unchanged. |
| 7 | Refresh the history view. | Removed/updated linked record behavior remains consistent after refresh. |
| 8 | Close and reopen the Logbook and History views for the same tool. | The removed entry remains absent and linked versus unrelated record behavior remains consistent after reopen. |

## Expected Outcome
Removed hardware change logbook entries and linked Magnet System history artifacts are handled consistently and persist after refresh/reopen. Only linked records are affected by the removal; unrelated Logbook and Magnet System history records remain unchanged.
