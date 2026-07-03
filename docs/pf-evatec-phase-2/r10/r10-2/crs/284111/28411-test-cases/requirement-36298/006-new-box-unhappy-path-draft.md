# 'R10.2 Update for CR 284111' - 'New Box': Unhappy Path [draft]
## Requirement
CR: 284111
Ticket: 34682
Requirement: In New Box flow, Self-Service creation must block save when WBS Element is missing or invalid.
## Preconditions
- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- At least one active project/work order with a valid project number is available.
- User is on `Boxes > Create New Box` page.
- Validation messages for required fields and format rules are enabled in the test environment.
| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open New Box, complete required base fields, and enable Self-Service. | WBS Element field is displayed and required. |
| 2 | Clear WBS Element and attempt to save. | Save is blocked and required validation for WBS Element is shown. |
| 3 | Enter a WBS value with an invalid suffix format and attempt to save. | Save is blocked and suffix format validation is shown. |
| 4 | Correct the value to a valid WBS suffix and save again. | Validation messages are cleared and save succeeds. |
| 5 | Re-open the created box. | Saved WBS Element reflects the corrected valid value only. |
## Expected Outcome
New Box unhappy path correctly prevents invalid Self-Service saves for missing or malformed WBS values and allows save only after valid correction.
