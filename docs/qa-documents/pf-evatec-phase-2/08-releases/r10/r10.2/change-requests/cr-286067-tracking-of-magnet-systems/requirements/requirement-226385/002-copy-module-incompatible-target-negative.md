# R10.2 Update for CR 286067 - Copy Module Hardware Configuration: Attempt to copy hardware configuration to an incompatible module type (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226385
Requirement: Copy Module Hardware Configuration (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A source module has a saved hardware configuration including a Magnet System role.
- At least one module of a different, incompatible type exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the source module 'Hardware Configuration' page. | The page loads and shows the saved source configuration, including the Magnet System role. |
| 2 | Trigger the 'Copy Hardware Configuration' action. | The copy dialog opens with target module selection. |
| 3 | Locate the incompatible module in the copy target selection. | The incompatible module cannot be selected for copy because it is filtered out or shown as disabled. |
| 4 | Attempt to proceed with the incompatible module as the target. | The copy action is blocked and a type compatibility validation is shown. No copy is executed. |
| 5 | Reopen the source module 'Hardware Configuration' page. | The source configuration is unchanged after the blocked attempt. |

## Expected Outcome
Hardware configuration cannot be copied to a module of an incompatible type. The target module selection is either filtered to compatible types only, or validation prevents the action. The source configuration is unchanged.
