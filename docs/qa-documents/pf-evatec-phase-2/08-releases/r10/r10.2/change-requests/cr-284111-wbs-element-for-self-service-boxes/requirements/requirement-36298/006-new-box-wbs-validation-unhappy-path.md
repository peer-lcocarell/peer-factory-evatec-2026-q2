# R10.2 284111 Self-Service Box - New Box WBS Required Format and Length Validation (Unhappy Path)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36298
- Requirement: Self-service save is blocked for missing/invalid WBS, pattern is enforced, and max length is 60.

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
| 5 | Save with valid data. | Save succeeds and record is created. |
| 6 | Re-open saved record. | WBS value persists exactly as saved and remains valid. |

## Expected Outcome

WBS required, format, and length validations are enforced deterministically, including the 60-character boundary.
