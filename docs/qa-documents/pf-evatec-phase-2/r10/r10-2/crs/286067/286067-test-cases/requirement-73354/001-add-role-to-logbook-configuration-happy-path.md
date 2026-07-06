# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify tester can assign a role to a logbook configuration and save changes (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- Manage Hardware screen is accessible with existing logbook categories.
- At least one predefined role name is available for assignment.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Manage Hardware and select a logbook category. | Category is opened for editing. |
| 2 | Add a new role to the logbook configuration and select a valid role name. | Role is added to the category list. |
| 3 | Save the logbook configuration changes. | Save succeeds without validation errors. |
| 4 | Re-open the same logbook configuration. | Added role persists and is displayed correctly. |

## Expected Outcome
Tester can assign a role to a logbook configuration and saved changes persist correctly.
