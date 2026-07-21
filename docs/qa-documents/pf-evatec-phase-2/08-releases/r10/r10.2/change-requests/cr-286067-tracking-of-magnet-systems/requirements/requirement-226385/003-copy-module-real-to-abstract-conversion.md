# R10.2 Update for CR 286067 - Copy Module Hardware Configuration: Real to Abstract Conversion Rules

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
| 1 | Open the source module 'Hardware Configuration' page. | The page loads and shows installed target and installed magnet system values in the source configuration. |
| 2 | Trigger 'Copy Hardware Configuration'. | The copy dialog opens and the compatible Abstract target module is selectable. |
| 3 | Select the compatible Abstract target module and confirm copy. | The copy completes successfully and creates pending values on the target module. |
| 4 | Open the target module and review the copied target role value. | The installed target from source is converted to a target type value and is not copied as an installed instance. |
| 5 | Review the copied magnet system role value on the target module. | The installed magnet system from source is converted to a magnet system type value and is not copied as an installed instance. |
| 6 | Save the target module configuration. | Save succeeds when no validation errors remain. |

## Expected Outcome
Real to Abstract copy converts installed target and installed magnet system to type-based values and supports save.

