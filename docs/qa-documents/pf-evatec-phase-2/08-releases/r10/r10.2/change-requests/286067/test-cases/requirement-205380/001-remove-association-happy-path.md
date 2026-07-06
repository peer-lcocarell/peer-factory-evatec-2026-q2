# R10.2 Update for CR 286067 - Remove Association: Verify tester can remove an existing hardware association (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205380
Requirement: Remove association (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- At least one hardware component with an existing association exists.
- Learned Associations screen is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Learned Associations and select a source hardware component. | Component is selected. |
| 2 | Select an existing association from the list. | Remove action becomes available. |
| 3 | Remove the association and confirm. | Association is removed successfully. |
| 4 | Refresh the associations view. | Removed association no longer appears. |

## Expected Outcome
Tester can remove an existing hardware association and the removal is persisted.
