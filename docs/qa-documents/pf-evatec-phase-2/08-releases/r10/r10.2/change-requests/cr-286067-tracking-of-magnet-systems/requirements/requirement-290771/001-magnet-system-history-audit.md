# R10.2 Update for CR 286067 - Magnet System History: Verify history records are generated when Magnet System information changes (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290771
Requirement: Magnet System History (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A Magnet System exists that can be edited.
- The 'Magnet System History' view is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System and navigate to the History view. | The History view loads. Existing history entries (at minimum a Create entry) are displayed. |
| 2 | Return to the Magnet System record and open it in Edit mode. Update an editable field (for example Last Inspection Date) and save. | Save completes. |
| 3 | Re-open the Magnet System History view. | A new history entry is present for the edit event with the current user and the timestamp. |

## Expected Outcome
Editing a Magnet System field generates a new history entry. The entry includes the acting user and timestamp. History entries accumulate chronologically without replacing prior entries.
