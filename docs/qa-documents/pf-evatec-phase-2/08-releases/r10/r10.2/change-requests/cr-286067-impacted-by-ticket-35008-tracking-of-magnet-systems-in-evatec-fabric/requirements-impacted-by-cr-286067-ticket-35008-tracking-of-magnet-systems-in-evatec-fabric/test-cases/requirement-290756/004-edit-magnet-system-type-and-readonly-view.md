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

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as the user with `MagnetSystemTypes_Edit` permission and navigate to the 'Magnet System Types' page. | The page loads and displays existing records. |
| 2 | Select an existing Magnet System Type from the list. | The detail or edit form for the selected record is displayed with editable fields. |
| 3 | Modify the Description and ERP Status fields. | The fields accept the updated values. |
| 4 | Save the changes. | The record is updated. The modified values are reflected in the list and detail view. |
| 5 | Log out and log in as the user with `MagnetSystemTypes_View` permission only. Navigate to the same record. | The record detail is displayed in read-only mode. No edit controls are available. |

## Expected Outcome
A user with `MagnetSystemTypes_Edit` permission can edit and save changes to an existing Magnet System Type. A user without that permission views the same record in read-only mode with no ability to modify data.
