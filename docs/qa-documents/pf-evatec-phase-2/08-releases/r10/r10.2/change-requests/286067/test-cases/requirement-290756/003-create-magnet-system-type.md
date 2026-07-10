# R10.2 Update for CR 286067 - Magnet System Types: Create New Magnet System Type

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemTypes_Edit` permission.
- The 'Magnet System Types' page is accessible from the Configuration navigation group.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to the 'Magnet System Types' page via the Configuration navigation group. | The page loads and displays the list of existing Magnet System Types. |
| 2 | Click the 'New' button. | A form is displayed for entering a new Magnet System Type. |
| 3 | Enter valid values for all required fields: Name, Article #, Variant Code, Source Type, Flexicat Type, Applications, ERP Status, Successor, and Description. | All fields accept input without validation errors. |
| 4 | Save the new Magnet System Type. | The record is saved. The new Magnet System Type appears in the list with all entered values displayed correctly. |

## Expected Outcome
A user with `MagnetSystemTypes_Edit` permission can create a new Magnet System Type. The record is persisted and visible in the list with all required fields populated.
