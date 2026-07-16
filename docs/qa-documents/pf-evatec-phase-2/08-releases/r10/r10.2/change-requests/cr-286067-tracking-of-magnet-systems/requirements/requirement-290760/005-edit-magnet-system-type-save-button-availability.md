# 286067 Magnet System Types - Edit Magnet System Type Save Button Availability (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Tags
- R10.2

## Preconditions
- User is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` permissions.
- At least one Standard Magnet System Type exists with known field values.
- The 'Magnet System Types' page is accessible from the application menu.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The list page loads and displays existing records. |
| 2 | Select a known Standard Magnet System Type and open it in Edit mode. | The Edit page loads with current field values populated. |
| 3 | Do not make any changes. Verify the Save button state. | The Save button is unavailable or disabled. |
| 4 | Update an editable field such as Description with a new value. | The field accepts the new input. The Save button becomes available. |
| 5 | Clear the updated field and restore the original value. | The Save button returns to unavailable or disabled state. |

## Expected Outcome
The Save button is only available when valid changes have been made. It is disabled or unavailable when no changes exist or when the form is returned to its original state.
