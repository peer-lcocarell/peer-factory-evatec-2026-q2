# R10.2 Update for CR 286067 - Copy Module Hardware Configuration: Attempt to copy hardware configuration to an incompatible module type (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226385
Requirement: Copy Module Hardware Configuration (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A source module has a saved hardware configuration including a Magnet System role.
- At least one target module of a different, incompatible type exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the source module's 'Hardware Configuration' page. | Configuration loads successfully with Magnet System role visible. |
| 2 | Trigger the 'Copy Hardware Configuration' action. | The copy dialog is displayed with a module selection step. |
| 3 | Select an incompatible target module type as the copy destination. | The incompatible module is identified as ineligible. Either it is not available in the selection list, or selecting it displays a validation error. |
| 4 | Confirm the selection attempt. | The copy action is blocked. A validation message is displayed identifying the type incompatibility. The source module configuration is unchanged. |

## Expected Outcome
Hardware configuration cannot be copied to a module of an incompatible type. The target module selection is either filtered to compatible types only, or validation prevents the action. The source configuration is unchanged.
