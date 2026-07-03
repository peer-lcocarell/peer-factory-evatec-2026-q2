# R10.2 Update for CR 286067 - Copy Module Hardware Configuration: Verify tester can copy hardware configuration from one module to another (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226385
Requirement: Copy Module Hardware Configuration (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- Source module has a saved hardware configuration.
- Compatible target module is available.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the source module Hardware Configuration. | Configuration loads successfully. |
| 2 | Trigger the Copy Configuration action and select the target module. | Copy dialog is displayed with target selection. |
| 3 | Confirm the copy action. | Copy completes successfully. |
| 4 | Open the target module Hardware Configuration. | Configuration reflects copied roles and hardware entries. |

## Expected Outcome
Tester can copy a module's hardware configuration to another compatible module accurately.
