# R10.2 284111 Self-Service Box - New Box Self-Service No WBS Hidden (Happy Path)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36298
- Requirement: When Self-Service is No, WBS Element is not displayed, not required, and saved as null.

## Preconditions

- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- At least one active Work Order exists.
- User is on `Boxes > Create New Box`.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Start New Box wizard and complete mandatory non-WBS fields. | User can proceed to self-service step. |
| 2 | Select `Is the box from the Self-Serve Station? = No`. | `WBS Element` field is not displayed. |
| 3 | Select a Work Order. | WBS field does not appear or change. |
| 4 | Complete remaining required fields and save. | Save succeeds without WBS entry. |
| 5 | Open saved box in view mode. | `Is Self-Serve = No` and WBS Element is not displayed. |
| 6 | Return to list and locate saved box. | Box is listed with `Self-Service = No`. |

## Expected Outcome

New box created with Self-Service = No requires no WBS entry and stores no WBS value.
