# R10.2 Update for CR 286067 - Edit Magnet System: Attempt to edit the Serial Number or Magnet System Number on an existing Magnet System (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290769
Requirement: Edit Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System exists with a known Serial Number and Magnet System Number.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open an existing Magnet System in Edit mode. | The Edit screen loads with current data displayed. |
| 2 | Locate the Serial Number field. | The Serial Number field is read-only and cannot be edited. No input control is active for this field. |
| 3 | Locate the Magnet System Number field. | The Magnet System Number field is read-only and cannot be edited. No input control is active for this field. |
| 4 | Modify an editable field (for example Comment or Last Inspection Date) and save. | Save completes without errors. The editable field value is updated. The Serial Number and Magnet System Number remain unchanged. |

## Expected Outcome
The Serial Number and Magnet System Number fields are immutable on an existing Magnet System record. Both fields are displayed as read-only in Edit mode. Editable fields can be saved without affecting the immutable fields.
