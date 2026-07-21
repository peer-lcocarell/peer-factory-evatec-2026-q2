# R10.2 Update for CR 286067 - Copy Module Hardware Configuration: Verify tester can copy hardware configuration from one module to another (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226385
Requirement: Copy Module Hardware Configuration (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A source module has a saved hardware configuration with role assignments and hardware entries.
- A compatible target module of the same type is available.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the source module 'Hardware Configuration' page. | The page loads and shows the saved source configuration. |
| 2 | Trigger the 'Copy Configuration' action. | The copy dialog opens and lists compatible target modules of the same module type. |
| 3 | Select the compatible target module and confirm the copy action. | The copy completes without validation errors. |
| 4 | Open the target module 'Hardware Configuration' page. | The target shows the copied role assignments and hardware entries, and values match the source configuration used for the copy. |
| 5 | Reopen the source module 'Hardware Configuration' page. | The source configuration is unchanged after the copy operation. |

## Expected Outcome
The hardware configuration from the source module is copied to the compatible target module. The target module configuration matches the copied source values for included roles. The source module configuration remains unchanged.
