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
- The current Magnet System value for the role is known before starting the test.
- A different valid Standard Magnet System candidate is available for selection.
- The 'Module Hardware Configuration' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the active real module and navigate to 'Module Hardware Configuration'. | Configuration page loads for the selected active module and the Magnet System role is visible. |
| 2 | Record the current Magnet System value shown for the role. | Baseline Magnet System value is captured for comparison and differs from the candidate to be selected. |
| 3 | Locate the Magnet System role and trigger the 'Change Magnet System' action. | A Magnet System selection dialog is displayed with selectable Standard Magnet System candidates. |
| 4 | Select a different valid Standard Magnet System candidate and confirm the selection. | Dialog closes and the selected Magnet System is shown as a pending change for the role. |
| 5 | Save configuration changes. | Save confirmation is shown and the Magnet System role displays the newly selected value. |
| 6 | Refresh the page and reopen the same module configuration page. | The Magnet System role still shows the newly selected value after refresh and reopen. |
| 7 | Trigger Export for the same module configuration and open the exported file. | Export file is generated and the Magnet System entry matches the newly selected value shown in the UI. |

## Expected Outcome
For an active real module, Change Magnet System is available and functional. A different valid Standard Magnet System can be selected, saved, and retained after refresh and reopen. The exported configuration contains the same Magnet System value shown in the UI after save.
