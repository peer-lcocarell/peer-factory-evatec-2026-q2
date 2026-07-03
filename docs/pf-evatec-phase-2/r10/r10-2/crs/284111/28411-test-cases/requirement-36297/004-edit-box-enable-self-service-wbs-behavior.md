# 'R10.2 Update for CR 284111' - 'Boxes': Self-Service Box - Non-Self-Service Unaffected and Data Consistency
## Requirement
CR: 284111
Ticket: 34682
Requirement: Non-self-service boxes remain unaffected and do not require or store WBS Element.
## Preconditions
- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- A valid project/work order is available for standard non-self-service box creation.
- User can access `Boxes` list and `View Box` pages for verification.
- An approved data-verification method is available if persistence checks are required.
| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Create a new box without selecting Self-Service. | WBS is not required for save. |
| 2 | Save the box and open the box in View mode. | Box is saved successfully and no Self-Service WBS requirement is shown. |
| 3 | Open Box List and verify this box status. | Box appears as non-self-service in list behavior. |
| 4 | Verify persisted data using approved method. | No unintended Self-Service WBS value is stored for this non-self-service box. |
## Expected Outcome
Non-self-service workflows are unchanged and no unintended WBS dependency or stored WBS data is introduced.
