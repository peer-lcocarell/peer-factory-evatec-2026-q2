# R10.2 Update for CR 286067 - Hardware Configuration for Real Module: Verify Change Magnet System is unavailable for retired modules (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226384
Requirement: Hardware Configuration for Real Module (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A real module exists in retired state.
- The retired module has historical hardware configuration data.
- The current Magnet System value for the retired module is known before starting the test.
- The 'Module Hardware Configuration' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the retired real module and navigate to 'Module Hardware Configuration'. | Configuration page loads in retired/read-only context. |
| 2 | Record the current Magnet System value shown for the role. | Baseline Magnet System value is captured for comparison. |
| 3 | Locate the Magnet System role controls. | 'Change Magnet System' action is not available or is disabled. |
| 4 | Attempt to trigger Magnet System change via available UI controls. | Action is blocked and no change dialog opens. |
| 5 | Attempt to save configuration changes. | Save is unavailable or no editable changes can be committed for retired module configuration. |
| 6 | Refresh and reopen the retired module configuration page. | Restriction state remains enforced and the Magnet System value matches the baseline value captured in Step 2. |

## Expected Outcome
For retired modules, Change Magnet System functionality is unavailable and cannot be executed through the UI. No Magnet System changes can be saved, and restrictions persist after refresh/reopen.
