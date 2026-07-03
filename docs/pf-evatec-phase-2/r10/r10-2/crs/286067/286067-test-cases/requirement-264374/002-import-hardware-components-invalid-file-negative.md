# R10.2 Update for CR 286067 - Import Hardware Components from File: Verify error message is displayed for an invalid import file (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 264374
Requirement: Import hardware components from file (Hardware Components)

## Preconditions
- User is signed in with permissions to import and view Hardware Components.
- An invalid file (unsupported format or malformed structure) is available.
- Existing hardware component data is present for regression check.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Hardware Components import screen. | Import controls are visible and enabled. |
| 2 | Select the invalid file and start import. | Import is rejected. |
| 3 | Review import error output. | Clear error message identifies the invalid file. |
| 4 | Verify existing hardware component data. | Existing data is unchanged. |

## Expected Outcome
System reports invalid import files with a clear error and preserves existing hardware components.
