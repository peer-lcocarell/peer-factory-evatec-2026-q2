# R10.2 Update for CR 286067 - Edit Magnet System Type: Verify tester can update Magnet System Type information (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- At least one editable Magnet System Type (Standard type) exists.
- The 'Magnet System Types' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open an existing Magnet System Type in Edit mode. | The Edit screen loads with the current data populated. |
| 2 | Update an editable field (for example Description or Applications). | The field accepts the new input. |
| 3 | Save the changes. | Save completes without validation errors. |
| 4 | Re-open the record. | The updated field values are persisted and displayed. ERP-sourced fields are unchanged. |

## Expected Outcome
User-entered fields on a Magnet System Type can be edited and saved. Updated values persist on re-open. ERP-sourced read-only fields are not changed by the edit.
