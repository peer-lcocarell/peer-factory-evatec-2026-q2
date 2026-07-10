# R10.2 Update for CR 286067 - Remove Association: Verify tester can remove the last learned magnet system association (Edge Case)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205380
Requirement: Remove association (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- A role exists with exactly one learned Standard Magnet System Type association.
- The 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Learned Associations' and select the role with exactly one learned magnet system association. | One learned magnet system association is displayed for the role. |
| 2 | Select the only association and trigger Remove, then confirm. | The association is removed from the list and no learned magnet associations remain displayed. |
| 3 | Save changes. | Save completes successfully without validation errors. |
| 4 | Refresh and reopen 'Learned Associations' for the same role. | No learned magnet system associations are displayed for the role. |
| 5 | Open the magnet system installation candidate list for the same role. | The previously removed magnet system type is not presented as a previously installed learned candidate. |

## Expected Outcome
The last learned magnet system association can be removed and saved successfully. After refresh/reopen, the role shows no learned magnet associations, and removed types are not offered as previously installed learned candidates.
