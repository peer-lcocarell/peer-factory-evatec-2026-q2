# 286067 Copy Module Hardware Configuration - Real to Abstract Conversion Rules

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226385
Requirement: Copy Module Hardware Configuration (Module Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- Source is a Real module and target is an Abstract module of the same module type.
- Source has saved hardware configuration containing installed target and installed magnet system values.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open source module Hardware Configuration and verify installed target and installed magnet system values exist. | Source contains installed-instance values for both roles. |
| 2 | Trigger Copy Hardware Configuration and select compatible abstract target module. | Copy dialog is displayed and target is selectable. |
| 3 | Confirm copy. | Copy completes successfully and pending values are created on target. |
| 4 | Open target module and review target role value. | Installed target is converted to target type (not copied as installed instance). |
| 5 | Review magnet system role value on target. | Installed magnet system is converted to magnet system type (not copied as installed instance). |
| 6 | Save target module configuration. | Save succeeds when no validation errors remain. |

## Expected Outcome
Real to Abstract copy converts installed target and installed magnet system to type-based values and supports save.
