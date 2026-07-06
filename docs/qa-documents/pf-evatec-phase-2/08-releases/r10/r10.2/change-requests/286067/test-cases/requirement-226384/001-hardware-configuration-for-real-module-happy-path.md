# R10.2 Update for CR 286067 - Hardware Configuration for Real Module: Verify hardware configuration is displayed for a real module (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226384
Requirement: Hardware Configuration for Real Module (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- A real module is docked to a tool and has hardware configuration data.
- Module Hardware Configuration screen is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the tool that has the real module docked. | Tool details load successfully. |
| 2 | Navigate to Hardware Configuration for the real module. | Module Hardware Configuration screen loads. |
| 3 | Verify displayed sections and hardware roles. | Configuration displays expected roles including magnet system role if configured. |
| 4 | Review displayed data. | Data reflects the current real module configuration. |

## Expected Outcome
Hardware configuration for a real module is displayed correctly with accurate data.
