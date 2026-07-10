# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Attempt to add a role with a duplicate role name to a logbook category (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- Tester is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- The 'Manage Hardware' screen is accessible.
- At least one logbook category exists with one existing role already assigned.
- The name of the existing role is known.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and select the logbook category containing an existing role. | The logbook category is opened for editing and the existing role is visible. |
| 2 | Select 'Add role' and enter the same role name as the existing role. | A validation message is displayed indicating the role name already exists in this category. |
| 3 | Attempt to save the duplicate role. | Save is blocked. The duplicate role is not added. The existing role remains unchanged. |
| 4 | Refresh the category and review the role list. | Only one instance of the original role name is displayed. No duplicate role is present. |
| 5 | Enter a different unique role name. | The duplicate-role validation message is removed. |
| 6 | Save the change. | Save completes without validation errors. The new role with the unique name is displayed in the category. |
| 7 | Close 'Manage Hardware', reopen it, and return to the same category. | The new unique role remains displayed and no duplicate role exists. |

## Expected Outcome
Duplicate role names within the same category are blocked and are not persisted. After replacing the duplicate with a unique role name, the validation clears, the role is saved, and the saved state persists after reopening.
