# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify validation is displayed when no role is selected (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- Tester is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- The 'Manage Hardware' screen is accessible with existing logbook categories.
- At least one logbook category is available for editing.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and select a logbook category. | The category is opened for editing. |
| 2 | Initiate adding a new role without selecting a role name. | The role name selector remains empty. No role name is selected. |
| 3 | Attempt to save the changes. | Save is blocked. A required-field validation message is displayed on the role name field. |
| 4 | Review the role list after the blocked save attempt. | No new role is added to the category. |
| 5 | Leave the category and return to the same category. | The invalid role entry is not present. The role list remains unchanged. |
| 6 | Select a valid role name and save again. | The validation message is removed. Save completes without validation errors. The role is added to the category. |

## Expected Outcome
Saving a role without selecting a role name is blocked and no invalid record is retained. After selecting a valid role name, the validation is cleared and the role is saved.
