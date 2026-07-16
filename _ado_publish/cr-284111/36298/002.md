# R10.2 284111 Self-Service Box - New Box WBS Validation (Unhappy Path)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36298
- Requirement: Self-service save is blocked for missing, invalid, out-of-length, or prefix-mismatched WBS values.

## Preconditions

- User is signed in with `Boxes_Create` permission.
- At least one active Work Order exists.
- User is on `Boxes > Create New Box` with `Self-Serve = Yes`.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Leave `WBS Element` empty and click Save. | Save is blocked and required validation message is shown. |
| 2 | Enter invalid format value (example: `WO12345-1-22`) and click Save. | Save is blocked and format validation message is shown. |
| 3 | Enter value exceeding 60 characters and click Save. | Save is blocked with length validation message. |
| 4 | Enter valid value exactly 60 characters that matches required suffix pattern. | Value is accepted with no length error. |
| 5 | Manually overwrite WBS with a value whose prefix does not match the selected Work Order. | Value is accepted in field. |
| 6 | Click Save with the mismatched WBS value. | Save is blocked with a validation message. |
| 7 | Restore WBS to a valid value matching the selected Work Order and save. | Save succeeds and record is created. |
| 8 | Re-open saved record. | WBS value persists exactly as saved and remains valid. |

## Expected Outcome

All WBS validation rules are enforced including required, format, length, and Work Order prefix consistency.
