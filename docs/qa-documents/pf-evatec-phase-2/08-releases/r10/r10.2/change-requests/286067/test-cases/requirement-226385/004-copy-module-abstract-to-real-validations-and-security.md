# 286067 Copy Module Hardware Configuration - Abstract to Real Validation and Security

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
| 1 | Sign in as User A and copy configuration from abstract source to compatible real target. | Copy completes and pending values are created. |
| 2 | Review wildcard, target, and magnet system roles on target. | Wildcards, target roles, and magnet system roles from source are not copied. |
| 3 | Review validation messages after copy. | Multiple-value role shows “Multiple hardware components found”. Missing-serial role shows serial-number validation error. |
| 4 | Attempt to save target configuration while validation errors exist. | Save is blocked. |
| 5 | Correct data so each affected role has one value and required serial numbers are present. | Validation errors clear. |
| 6 | Save target configuration again. | Save succeeds when at least one pending change exists and no validation errors remain. |
| 7 | Sign in as User B and attempt Copy Hardware Configuration. | Copy action is unavailable or blocked due to missing `HardwareConfiguration_Edit`. No copy is performed. |

## Expected Outcome
Abstract to Real copy enforces exclusion and validation rules, blocks save until errors are resolved, then allows save. Copy actions require `HardwareConfiguration_Edit`.
