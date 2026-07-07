# R10.2 Update for CR 286067 - Import Hardware Components from File: Verify error message is displayed for an invalid import file (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 264374
Requirement: Import hardware components from file (Hardware Components)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- An invalid file is available (unsupported format or malformed structure).
- Existing Hardware Component data is present for regression comparison.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Components' import screen. | Import controls are visible and enabled. |
| 2 | Select the invalid file and start the import. | Import is rejected. No records are processed. |
| 3 | Review the import error output. | A clear error message is displayed identifying the file as invalid (specifying the format error or structural issue). |
| 4 | Navigate to Hardware Components and verify existing records. | Existing Hardware Component records are unchanged. No records were added, updated, or deleted. |

## Expected Outcome
An invalid import file is rejected before processing. A clear error message identifies the file as invalid. Existing Hardware Component data is preserved.
