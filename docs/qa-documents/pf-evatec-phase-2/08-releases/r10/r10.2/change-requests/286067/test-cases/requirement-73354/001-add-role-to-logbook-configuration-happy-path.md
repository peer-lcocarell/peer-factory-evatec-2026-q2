# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify tester can assign a role to a logbook configuration and save changes (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- Tester is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- The 'Manage Hardware' screen is accessible with existing logbook categories.
- At least one predefined role name is available for assignment.
- The selected category does not already contain the role name being added.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and select a logbook category. | The category is opened for editing and the existing role list is displayed. |
| 2 | Select 'Add role'. | A new role entry is displayed for configuration. |
| 3 | Review the available values in the 'Role Name' selection list. | The 'Role Name' list contains predefined values sourced from Module Type to Role Name. |
| 4 | Review the default values before changing any fields. | The default 'Role Type' value is 'Hardware Component'. The default 'Always Active' value is 'No'. |
| 5 | Select a valid unique role name. | The selected role name is displayed in the new role entry. |
| 6 | Set 'Role Type' to 'Magnet System'. | The selected role type is displayed as 'Magnet System'. |
| 7 | Set 'Always Active' to 'Yes' for the Magnet System role. | The role displays 'Always Active' as 'Yes'. |
| 8 | Add a role with role type `Text` and a valid unique role name. | The role is displayed with role type `Text`. |
| 9 | Add a role with role type `File` and a valid unique role name. | The role is displayed with role type `File`. |
| 10 | Add a role with a predefined custom value from 'Logbook Role Types' and a valid unique role name. | The role is displayed with the selected custom role type. |
| 11 | Save the logbook configuration changes. | Save completes without validation errors. |
| 12 | Close 'Manage Hardware', reopen it, and return to the same logbook category. | The added roles are displayed. Role names, role types, and 'Always Active' values match the saved configuration. |

## Expected Outcome
Roles can be added with predefined role names, default values are applied correctly, Text/File/Custom role types are selectable, and saved values persist after reopening.
