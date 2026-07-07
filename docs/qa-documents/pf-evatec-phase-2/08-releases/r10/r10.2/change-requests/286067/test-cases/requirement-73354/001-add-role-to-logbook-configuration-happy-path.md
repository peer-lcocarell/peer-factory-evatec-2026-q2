# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify tester can assign a role to a logbook configuration and save changes (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- The 'Manage Hardware' screen is accessible with existing logbook categories.
- At least one predefined role name is available for assignment.
- The selected category does not already contain the role name being added.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and select a logbook category. | The category is opened for editing and the existing role list is displayed. |
| 2 | Add a new role and select a valid unique role name. | The role is added to the category list with the selected name. |
| 3 | Set the role type to `Magnet System` or `Target` and review the serial number requirement setting. | The 'Requires Serial Number' value is set to `Yes` and the field is read-only and cannot be changed. |
| 4 | Save the logbook configuration changes. | Save completes without validation errors. |
| 5 | Re-open the same logbook configuration. | The added role is displayed with the correct role type and the 'Requires Serial Number' value of `Yes`. |

## Expected Outcome
A unique role is added to the logbook configuration. The role type constraint is enforced: for Magnet System and Target role types, 'Requires Serial Number' is set to `Yes` and cannot be changed. The role persists after save and is displayed on re-open.
