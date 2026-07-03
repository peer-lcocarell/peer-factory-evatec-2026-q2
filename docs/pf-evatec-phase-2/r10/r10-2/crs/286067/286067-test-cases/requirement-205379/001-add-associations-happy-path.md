# R10.2 Update for CR 286067 - Add Associations: Verify tester can create a new hardware association (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205379
Requirement: Add associations (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- Hardware components eligible for association exist.
- Learned Associations screen is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Learned Associations and select a source hardware component. | Component is selected. |
| 2 | Choose Add association action and select a target component. | Association draft is created. |
| 3 | Save the new association. | Save succeeds without validation errors. |
| 4 | Refresh the associations view. | New association is displayed for the source component. |

## Expected Outcome
Tester can create a new hardware association and it persists in Learned Associations.
