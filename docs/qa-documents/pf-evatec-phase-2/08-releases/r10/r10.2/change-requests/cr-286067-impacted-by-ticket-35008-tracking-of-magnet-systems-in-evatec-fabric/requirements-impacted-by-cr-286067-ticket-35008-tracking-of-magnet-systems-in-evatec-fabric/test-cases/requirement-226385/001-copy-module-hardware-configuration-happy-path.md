# R10.2 Update for CR 286067 - Copy Module Hardware Configuration: Verify tester can copy hardware configuration from one module to another (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226385
Requirement: Copy Module Hardware Configuration (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A source module has a saved hardware configuration including role assignments.
- A compatible target module of the same type is available.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the source module 'Hardware Configuration' page. | Configuration loads with the existing role assignments. |
| 2 | Trigger the 'Copy Configuration' action and select the compatible target module. | The copy dialog is displayed. The compatible target module is selectable. |
| 3 | Confirm the copy action. | The copy completes without validation errors. |
| 4 | Open the 'Hardware Configuration' page for the target module. | The target module configuration reflects the copied roles and hardware entries from the source module. |

## Expected Outcome
The hardware configuration from the source module is copied to the compatible target module. The target module configuration displays the same role structure as the source. The source module configuration is unchanged.
