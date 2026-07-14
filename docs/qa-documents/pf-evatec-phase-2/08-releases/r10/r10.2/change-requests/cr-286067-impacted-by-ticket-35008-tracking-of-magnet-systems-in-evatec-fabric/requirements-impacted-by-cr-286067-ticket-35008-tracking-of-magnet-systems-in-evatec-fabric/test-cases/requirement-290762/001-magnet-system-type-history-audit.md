# R10.2 Update for CR 286067 - Magnet System Type History: Verify history records are created when Magnet System Type changes occur (Audit)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290762
Requirement: Magnet System Type History (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Magnet System Type exists that can be edited.
- The 'Magnet System Type History' view is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System Type and navigate to the History view. | The History view loads. A creation history entry is present with the original user and timestamp. |
| 2 | Return to the Magnet System Type and open it in Edit mode. Update an editable field (for example Applications or Description) and save. | Save completes. |
| 3 | Re-open the History view. | A new history entry is present for the edit event. The entry includes the current user, the timestamp, and a description of the change. |
| 4 | Verify the history entries are in chronological order. | The Create entry precedes the Edit entry. All entries display the correct user and timestamp. |

## Expected Outcome
Each change to a Magnet System Type generates a distinct history entry. History entries include the acting user and timestamp. Entries are in chronological order. The History view provides a complete audit trail of all changes to the record.
