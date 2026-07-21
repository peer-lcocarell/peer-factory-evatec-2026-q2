# R10.2 Update for CR 286067 - Copy Module Hardware Configuration: Abstract to Real Validation and Security

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 226385
Requirement: Copy Module Hardware Configuration (Module Hardware Configuration)

## Preconditions
- User A has `HardwareConfiguration_View` and `HardwareConfiguration_Edit`.
- User B has `HardwareConfiguration_View` only.
- Source is an Abstract module and target is a Real module of the same module type.
- Source includes wildcard values, target role values, magnet system role values, at least one role with multiple values, and at least one role requiring serial number with missing serial.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Sign in as User A and copy configuration from the Abstract source module to the compatible Real target module. | Copy completes and pending values are created on the target module. |
| 2 | Review wildcard, target, and magnet system roles on the target module. | Wildcard values, target role values, and magnet system role values from source are not copied to the target. |
| 3 | Review validation messages on the target module after copy. | The multiple-value role shows "Multiple hardware components found" and the missing-serial role shows a serial number validation error. |
| 4 | Attempt to save the target configuration while validation errors are present. | Save is blocked. |
| 5 | Correct the multiple-value role so only one value remains. | The "Multiple hardware components found" validation error is cleared. |
| 6 | Enter required serial number values for roles that require serial number. | Serial number validation errors are cleared. |
| 7 | Save the target configuration again. | Save succeeds when at least one pending change exists and no validation errors remain. |
| 8 | Sign in as User B and attempt 'Copy Hardware Configuration'. | Copy action is not available to User B because `HardwareConfiguration_Edit` is missing and no copy is performed. |

## Expected Outcome
Abstract to Real copy enforces exclusion and validation rules, blocks save until errors are resolved, then allows save. Copy actions require `HardwareConfiguration_Edit`.
