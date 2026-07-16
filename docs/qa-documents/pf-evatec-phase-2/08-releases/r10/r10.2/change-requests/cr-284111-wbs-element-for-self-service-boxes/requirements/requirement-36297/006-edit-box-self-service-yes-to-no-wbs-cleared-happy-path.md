# R10.2 284111 Self-Service Box - Edit Box Self-Service Yes to No WBS Cleared (Happy Path)

## Requirement
- CR: 284111
- Ticket: 34682
- Requirement ID: 36297
- Requirement: When IsSelfServe is set to false on edit, WBS Element is hidden and saved as null.

## Preconditions

- User is signed in with `Boxes_Edit` and `Boxes_View` permissions.
- An existing active box with `IsSelfServe = true` and a populated WBS Element is available.
- User is on the `Boxes` list page.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an existing self-service box in edit mode. | Box opens with `Is Self-Serve = Yes` and WBS Element displayed. |
| 2 | Change `Is Self-Serve` to `No`. | WBS Element field is hidden. |
| 3 | Save the record. | Save succeeds without WBS entry. |
| 4 | Re-open the saved box in view mode. | `Is Self-Serve = No` and WBS Element is not displayed. |
| 5 | Return to list and locate the record. | Box shows `Self-Service = No`. |

## Expected Outcome

Toggling an existing box to Self-Service = No clears and hides WBS Element and persists null to the database.
