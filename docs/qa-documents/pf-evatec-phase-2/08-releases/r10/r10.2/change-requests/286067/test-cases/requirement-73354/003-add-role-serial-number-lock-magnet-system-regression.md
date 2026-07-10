# R10.2 Update for CR 286067 - Add Role to Logbook Configuration: Verify the serial number requirement is locked to Yes and cannot be changed for a Magnet System role type (Regression)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 73354
Requirement: Add Role to Logbook Configuration (Logbook Configuration)

## Preconditions
- Tester is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- The 'Manage Hardware' screen is accessible with an existing logbook category.
- A Magnet System role has been added to the logbook category.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and navigate to the logbook category containing the Magnet System role. | The logbook category is displayed with the Magnet System role visible. |
| 2 | Select the Magnet System role. | The 'Role Type' value is displayed as `Magnet System`. The 'Requires Serial Number' value is displayed as `Yes`. |
| 3 | Attempt to change the 'Requires Serial Number' value to `No`. | The 'Requires Serial Number' control is read-only or disabled and the value remains `Yes`. |
| 4 | Select an existing Target role in the same category. | The 'Role Type' value is displayed as `Target`. The 'Requires Serial Number' value is displayed as `Yes` and the control is read-only or disabled. |
| 5 | Set 'Always Active' to `Yes` for the Target role. | The Target role displays 'Always Active' as `Yes`. |
| 6 | Select a Hardware Component role in the same category and set 'Requires Serial Number' to `No`. | The Hardware Component role displays an editable 'Requires Serial Number' control and the value is set to `No`. |
| 7 | Set that Hardware Component role type to `Target`. | 'Requires Serial Number' is displayed as `Yes` and the control becomes read-only or disabled. |
| 8 | Set that role type to `Magnet System`. | 'Requires Serial Number' remains `Yes` and the control remains read-only or disabled. |
| 9 | Set that role type back to `Hardware Component`. | The 'Requires Serial Number' control becomes editable again. |
| 10 | Enter keywords for one Hardware Component role, one Target role, and one Magnet System role. | Keyword values are displayed for all three role types. |
| 11 | Save the logbook configuration. | Save completes without validation errors. |
| 12 | Close 'Manage Hardware', reopen it, and return to the same logbook category. | The Magnet System and Target roles are displayed in the category. |
| 13 | Review role values after reopening. | Magnet System and Target still show read-only `Yes` for 'Requires Serial Number'; Hardware Component remains editable; saved keyword values are displayed for Hardware Component, Target, and Magnet System roles; Target 'Always Active' remains `Yes`. |

## Expected Outcome
Serial-number behavior and role transitions are enforced correctly across Hardware Component, Target, and Magnet System role types, and keyword values for these role types persist after save and reopen.
