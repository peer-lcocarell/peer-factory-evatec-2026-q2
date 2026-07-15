# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify ManageHardware_Edit permission is required

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- Tester account A has `ManageHardware_View` permission and does not have `ManageHardware_Edit` permission.
- Tester account B with `ManageHardware_Edit` permission exists for baseline comparison if needed.
- The 'Manage Hardware' screen is accessible.
- At least one logbook category exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in using tester account A and open 'Manage Hardware'. | 'Manage Hardware' is displayed. |
| 2 | Navigate to a logbook category. | The category is displayed. |
| 3 | Attempt to add a role. | Role creation functionality is unavailable. |
| 4 | Attempt to edit an existing role. | Role editing functionality is unavailable. |
| 5 | Attempt to save configuration changes. | Configuration changes cannot be saved. |

## Expected Outcome
`ManageHardware_Edit` permission is required to create or edit logbook roles and to save configuration changes.
