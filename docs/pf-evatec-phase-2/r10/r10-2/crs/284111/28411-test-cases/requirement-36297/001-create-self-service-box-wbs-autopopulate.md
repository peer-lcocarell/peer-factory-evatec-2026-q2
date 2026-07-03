# 'R10.2 Update for CR 284111' - 'Boxes': Self-Service Box - Create Flow WBS Default and Validation
## Requirement
CR: 284111
Ticket: 34682
Requirement: In create flow, selecting Self-Service shows WBS, makes it required, auto-populates from project number, and enforces suffix format.
## Preconditions
- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- At least one active project/work order with a valid project number is available.
- User is on `Boxes > Create New Box` (or `New Box` / `Create Box`) page.
- Required predefined values for box creation (for example Location and substrate-related values) are available.
| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Start a new box and select Self-Service. | WBS Element field is displayed. |
| 2 | Verify the default WBS value. | WBS is auto-populated from the linked project number pattern. |
| 3 | Clear WBS and attempt to save. | Save is blocked and WBS required validation is shown. |
| 4 | Enter an invalid WBS suffix and attempt to save. | Save is blocked and suffix format validation is shown. |
| 5 | Enter valid WBS suffix and save. | Save succeeds and box is created as Self-Service. |
## Expected Outcome
Create flow correctly enforces WBS visibility, required behavior, suffix format, and valid save for Self-Service boxes.
