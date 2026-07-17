# R10.2 Update for CR 286067 - Magnet System Types: Edit Existing Magnet System Type and Read-Only View

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- A user account exists with `MagnetSystemTypes_Edit` permission.
- A second user account exists with `MagnetSystemTypes_View` permission only.
- At least one existing Magnet System Type record exists.
- At least one existing Magnet System Type record is in Standard status.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as the user with `MagnetSystemTypes_Edit` permission and open the 'Magnet System Types' list page. | The page loads and displays existing records. |
| 2 | Select a Standard Magnet System Type from the list and open its detail page. | The detail view opens with an Edit action available. |
| 3 | Click Edit and modify the Comment or Description field and ERP Status field. | Fields accept updated values. |
| 4 | Save the changes. | The record is updated successfully. Updated values are visible on the detail page and reflected in the list. |
| 5 | Log out and log in as the user with `MagnetSystemTypes_View` permission only. Navigate to the same record. | The record detail is displayed in read-only mode. No edit controls are available. |

## Expected Outcome
A user with `MagnetSystemTypes_Edit` permission can edit and save changes to an existing Magnet System Type from the list workflow. A user without that permission can view details only in read-only mode.
