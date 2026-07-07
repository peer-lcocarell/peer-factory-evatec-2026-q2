# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify the serial number requirement is locked to Yes and cannot be changed for a Magnet System role type (Regression)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- The 'Manage Hardware' screen is accessible with an existing logbook category.
- A Magnet System role has been added to the logbook category.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and navigate to the logbook category containing the Magnet System role. | The logbook category is displayed with the Magnet System role visible. |
| 2 | Select the Magnet System role and review the 'Requires Serial Number' setting. | The 'Requires Serial Number' value is set to `Yes`. |
| 3 | Attempt to change the 'Requires Serial Number' value to `No`. | The control is read-only or disabled. The value cannot be changed. |
| 4 | Verify a Target role in the same category. | The 'Requires Serial Number' value for the Target role is also `Yes` and cannot be changed. |

## Expected Outcome
For both Magnet System and Target role types, the 'Requires Serial Number' field is permanently set to `Yes` and cannot be changed by any user. The field is enforced as read-only in the logbook configuration editor.
