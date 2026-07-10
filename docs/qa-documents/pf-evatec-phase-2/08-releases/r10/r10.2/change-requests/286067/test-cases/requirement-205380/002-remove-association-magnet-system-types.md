# R10.2 Update for CR 286067 - Remove Association: Verify tester can remove a learned magnet system association

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205380
Requirement: Remove association (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- A role exists with one or more learned Standard Magnet System Type associations.
- The 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Learned Associations' and select the role with learned magnet system associations. | The role is selected and associated magnet system types are displayed. |
| 2 | Select one learned Standard Magnet System Type association from the list. | The selected association is highlighted and the 'Remove' action is available. |
| 3 | Trigger the Remove action and confirm. | The selected magnet system association is removed from the displayed list. |
| 4 | Save changes. | Save completes successfully without validation errors. |
| 5 | Refresh and reopen 'Learned Associations' for the same role. | The removed magnet system association is not displayed. |
| 6 | Open the magnet system installation candidate list for the same role. | The removed magnet system type is no longer offered as a previously installed learned candidate. |

## Expected Outcome
A learned magnet system association can be removed and saved. The removed magnet system type remains absent after refresh/reopen and is no longer available as a previously installed learned candidate.
