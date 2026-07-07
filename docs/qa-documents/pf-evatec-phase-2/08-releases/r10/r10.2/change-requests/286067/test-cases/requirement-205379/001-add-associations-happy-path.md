# R10.2 Update for CR 286067 - Add Associations: Verify tester can create a new hardware association (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205379
Requirement: Add associations (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- Hardware Components eligible for association exist, including at least one Magnet System role candidate.
- The 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Learned Associations' and select a source Hardware Component. | The component is selected and the existing associations are displayed. |
| 2 | Trigger the 'Add Association' action and select a target component of Magnet System role scope (Standard Magnet System Types only). | The association draft is created. The target component is listed as a pending association. |
| 3 | Save the new association. | Save completes without validation errors. |
| 4 | Refresh the associations view. | The new association is displayed in the list for the source component. |

## Expected Outcome
A new hardware association is created and persists in 'Learned Associations'. The association scope for Magnet System role type is limited to Standard Magnet System Types.
