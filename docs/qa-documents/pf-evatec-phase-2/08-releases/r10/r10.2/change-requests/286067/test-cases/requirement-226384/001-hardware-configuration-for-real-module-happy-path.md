# R10.2 Update for CR 286067 - Hardware Configuration for Real Module: Verify hardware configuration is displayed for a real module (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226384
Requirement: Hardware Configuration for Real Module (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- A real module is docked to a tool and has existing hardware configuration data.
- The 'Module Hardware Configuration' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the tool that has the real module docked. | Tool details load. |
| 2 | Navigate to the 'Hardware Configuration' page for the real module. | The 'Module Hardware Configuration' screen loads with the real module configuration. |
| 3 | Verify the displayed sections and hardware roles. | Configuration displays the expected roles. If a Magnet System role is configured, it is visible in the list. |
| 4 | Review the displayed field values. | Data reflects the current configuration for the real module and matches the expected setup. |

## Expected Outcome
The 'Hardware Configuration' page for a real module loads and displays the current configuration with all configured roles, including the Magnet System role if present. Displayed data matches the actual module configuration.
