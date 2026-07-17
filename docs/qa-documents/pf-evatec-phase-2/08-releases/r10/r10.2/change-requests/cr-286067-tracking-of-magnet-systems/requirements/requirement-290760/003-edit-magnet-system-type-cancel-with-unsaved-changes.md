# 286067 Magnet System Types - Edit Magnet System Type Cancel With Unsaved Changes (Negative Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Tags
- R10.2

## Preconditions
- User is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` permissions.
- At least one editable Magnet System Type exists with known field values.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open an existing Magnet System Type in Edit mode. | The Edit screen loads with current field values populated. |
| 2 | Modify an editable field (for example Description). | The field accepts the new input. The Cancel button becomes available. |
| 3 | Click Cancel without saving. | A confirmation prompt is displayed asking the user to confirm discarding unsaved changes. |
| 4 | Select the option to return to editing. | The confirmation prompt closes. The Edit page remains open with the unsaved changes intact. |
| 5 | Click Cancel again and confirm the discard action. | The user is redirected out of Edit mode to the configured non-edit destination. No changes are saved. |
| 6 | Open the same Magnet System Type detail and edit pages again. | The field values match the original pre-edit values. The unsaved changes are not persisted. |

## Expected Outcome
When a user modifies a Magnet System Type and clicks Cancel, a confirmation prompt is displayed before redirecting. If the user cancels the discard, they are returned to editing with changes intact. If the user confirms the discard, they are redirected out of Edit mode and no changes are saved to the record.
