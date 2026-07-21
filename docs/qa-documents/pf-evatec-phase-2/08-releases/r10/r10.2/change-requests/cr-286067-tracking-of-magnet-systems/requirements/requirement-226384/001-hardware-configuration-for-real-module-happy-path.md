# R10.2 Update for CR 286067 - Hardware Configuration for Real Module: Verify hardware configuration is displayed for a real module (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226384
Requirement: Hardware Configuration for Real Module (Module Hardware Configuration)

Test Case ID: https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/293109

## Preconditions
- Tester is signed in with `HardwareConfiguration_View` permission.
- A real module is docked to a tool and has existing hardware configuration data.
- The selected module has known expected roles and values in test reference data.
- The selected module identity is known for verification after refresh and reopen.
- The 'Module Hardware Configuration' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the tool that has the real module docked. | Tool details load and the selected real module is visible by module identifier. |
| 2 | Navigate to the 'Hardware Configuration' page for the selected real module. | The 'Module Hardware Configuration' screen loads for the selected real module and shows the same module identifier. |
| 3 | Verify the displayed sections and hardware roles against the reference data. | All configured roles for the module are visible. Magnet System role is visible when configured for the module. |
| 4 | Verify displayed values for each visible role against the reference data. | Each displayed role value matches the current stored configuration for the module. |
| 5 | Verify control availability on the page. | Controls match view access state. Save action is not available for committing changes. |
| 6 | Refresh the browser while on the same module hardware configuration page. | Page reloads without error message. The same module identifier, role list, and role values remain displayed. |
| 7 | Navigate away from the page and reopen the same module hardware configuration page. | Page reopens for the same module. Displayed role list and values remain unchanged from Step 4. |
| 8 | Observe page-level messages after load, refresh, and reopen. | No validation message or system error banner is displayed during these actions. |
| 9 | Return to tool details and re-open hardware configuration from the module entry point. | Navigation remains functional and opens the same module hardware configuration without altering displayed role data. |

## Expected Outcome
The 'Hardware Configuration' page for a real module loads for the selected module and displays all configured roles. Magnet System role is shown when configured. Displayed values remain accurate after refresh and reopen. View access control states are enforced and no validation or system error message is shown during normal page load and navigation.
