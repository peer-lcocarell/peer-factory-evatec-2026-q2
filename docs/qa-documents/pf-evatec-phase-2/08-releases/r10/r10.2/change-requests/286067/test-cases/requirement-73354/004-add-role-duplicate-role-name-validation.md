# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Attempt to add a role with a duplicate role name to a logbook category (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- The 'Manage Hardware' screen is accessible.
- At least one logbook category exists with one existing role already assigned.
- The name of the existing role is known.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and select the logbook category containing an existing role. | The logbook category is opened for editing and the existing role is visible. |
| 2 | Select 'Add role' and enter the same role name as the existing role. | A validation error or warning is displayed indicating the role name already exists in this category. |
| 3 | Attempt to save the duplicate role. | Save is blocked. The duplicate role is not added. The existing role remains unchanged. |
| 4 | Enter a different unique role name. | No validation error is displayed. |
| 5 | Save the change. | The new role with the unique name is saved and appears in the category. |

## Expected Outcome
Duplicate role names within the same logbook category are not permitted. A validation error is displayed and the save is blocked when a duplicate name is entered. A unique role name is accepted and saved.
