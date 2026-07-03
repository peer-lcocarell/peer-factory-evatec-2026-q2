# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify validation is displayed when no role is selected (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- Manage Hardware screen is accessible with existing logbook categories.
- At least one logbook category is available for editing.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Manage Hardware and select a logbook category. | Category is opened for editing. |
| 2 | Attempt to add a role without selecting a role name. | Role name selector remains empty. |
| 3 | Attempt to save changes. | Save is blocked and required-field validation is displayed. |
| 4 | Select a valid role and save again. | Validation clears and save succeeds. |

## Expected Outcome
System prevents saving a logbook configuration role without a selected role name and displays clear validation.
