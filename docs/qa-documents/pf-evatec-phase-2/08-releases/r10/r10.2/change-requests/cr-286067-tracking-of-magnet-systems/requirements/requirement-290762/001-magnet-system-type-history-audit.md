# R10.2 Update for CR 286067 - Magnet System Type History: Verify history records are created when Magnet System Type changes occur (Audit)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290762
Requirement: Magnet System Type History (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Standard Magnet System Type exists with a known Article Number.
- At least one Magnet System is currently assigned to the type.
- The 'Magnet System Type History' view is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type details view and navigate to the History area. | The History view loads and the currently assigned Magnet Systems are visible in the same details context. A creation history entry is present. |
| 2 | Review the creation history entry for the Standard type. | The entry includes timestamp, creating user, and a short summary that includes the Standard Article Number. |
| 3 | Open the Magnet System Type in Edit mode and keep the History view visible or accessible from the edit context. | The currently assigned Magnet Systems are visible in edit context and history remains available. |
| 4 | Update an editable field such as Applications or Description and save. | Save completes successfully. |
| 5 | Re-open or refresh the History view. | A new edit history entry is present. The entry includes timestamp, editing user, and a short summary of what changed. |
| 6 | Verify the order of entries in history. | The Create entry appears before the Edit entry and all displayed timestamps and users are correct. |

## Expected Outcome
The Magnet System Type history is available from details and edit contexts and shows both assigned Magnet Systems and lifetime changes. Standard create entries include Article Number in the summary. Edit entries include user, timestamp, and short change summary. The full audit trail remains in chronological order.
