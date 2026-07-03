# 'R10.2 Update for CR 284111' - 'New Box': Happy Path [draft]
## Requirement
CR: 284111
Ticket: 34682
Requirement: User can create a Self-Service box and save a valid WBS Element that is auto-populated from project number.
## Preconditions
- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- At least one active project/work order with a valid project number is available.
- User is on `Boxes > Create New Box` page.
- Required predefined values for box creation (for example Location and substrate-related values) are available.
| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open New Box and enter all mandatory box data. | Required fields are accepted and no validation error is shown for completed fields. |
| 2 | Enable Self-Service for the new box. | WBS Element field is displayed and marked as required. |
| 3 | Verify the default WBS Element value. | WBS Element is auto-populated using the linked project number pattern. |
| 4 | Keep a valid WBS value and save the new box. | Save succeeds and a new box record is created. |
| 5 | Open the created box in View and then Edit mode. | Self-Service flag and saved WBS Element are persisted and displayed consistently. |
## Expected Outcome
New Box happy path succeeds with Self-Service enabled, valid WBS auto-population, successful save, and consistent persisted values across pages.
