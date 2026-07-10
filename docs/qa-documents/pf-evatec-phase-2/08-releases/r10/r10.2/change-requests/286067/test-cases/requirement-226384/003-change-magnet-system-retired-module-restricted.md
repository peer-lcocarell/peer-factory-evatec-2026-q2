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
- The 'Module Hardware Configuration' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the retired real module and navigate to 'Module Hardware Configuration'. | Configuration page loads in retired/read-only context. |
| 2 | Locate the Magnet System role controls. | 'Change Magnet System' action is not available or is disabled. |
| 3 | Attempt to trigger Magnet System change via available UI controls. | Action is blocked; no change dialog opens and no pending change is created. |
| 4 | Attempt to save configuration changes. | Save is unavailable or no editable changes can be committed for retired module configuration. |
| 5 | Refresh and reopen the retired module configuration page. | Restriction state remains enforced and Magnet System assignment remains unchanged. |

## Expected Outcome
For retired modules, Change Magnet System functionality is unavailable and cannot be executed through the UI. No Magnet System changes can be saved, and restrictions persist after refresh/reopen.
