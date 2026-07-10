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
| 2 | Trigger the 'Add Association' action for Magnet System role scope and select one Standard Magnet System Type target. | The association draft is created and the selected Standard Magnet System Type target is listed as pending. |
| 3 | Save the new association. | Save completes without validation errors. |
| 4 | Refresh the associations view. | The new association is displayed in the list for the source component. |
| 5 | Close and reopen 'Learned Associations' for the same source component. | The saved association remains present and unchanged after reopen. |

## Expected Outcome
A new Magnet System association can be created using a Standard Magnet System Type and persists after refresh and reopen. The saved association remains linked to the selected source component.
