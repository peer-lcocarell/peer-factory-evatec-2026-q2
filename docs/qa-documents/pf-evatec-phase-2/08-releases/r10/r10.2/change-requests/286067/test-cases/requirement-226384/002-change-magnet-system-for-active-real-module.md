# R10.2 Update for CR 286067 - Hardware Configuration for Real Module: Verify Change Magnet System for an active real module

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226384
Requirement: Hardware Configuration for Real Module (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A real module is docked and active (not retired).
- The module contains a configurable Magnet System role.
- At least one valid Standard Magnet System candidate is available.
- The 'Module Hardware Configuration' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the active real module and navigate to 'Module Hardware Configuration'. | Configuration page loads for the selected active module. |
| 2 | Locate the Magnet System role and trigger the 'Change Magnet System' action. | A Magnet System selection dialog or picker is displayed. |
| 3 | Select a valid Standard Magnet System candidate. | Selection is accepted and shown as pending change for the Magnet System role. |
| 4 | Save configuration changes. | Save completes without validation errors. |
| 5 | Refresh and reopen the same module configuration page. | The newly selected Magnet System remains assigned to the role after refresh and reopen. |
| 6 | Trigger Export for the same module configuration and inspect the Magnet System entry. | Export contains the updated Magnet System assignment in the expected Standard format. |

## Expected Outcome
For an active real module, Change Magnet System is available and functional. Selected Standard Magnet System changes can be saved, persist after refresh/reopen, and are reflected in export output.
