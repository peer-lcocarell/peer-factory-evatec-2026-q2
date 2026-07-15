# R10.2 Update for CR 286067 - Learned Associations: Verify no learned magnet system association is displayed when none exists (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205378
Requirement: Learned Associations (Manage Hardware)

## Preconditions
- User is signed in with `ManageHardware_View` permission.
- At least one role exists that has no learned magnet system association recorded.
- The 'Manage Hardware' > 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and navigate to 'Learned Associations'. | The 'Learned Associations' screen loads. |
| 2 | Select a role known to have no learned magnet system association. | The role is selected and the associations panel loads. |
| 3 | Review the learned associations list. | No learned magnet system association entries are displayed and an empty-state message is shown. |
| 4 | Verify no association entries are present for the selected role. | No magnet system type association metadata is displayed for the role. |
| 5 | Refresh and reopen 'Learned Associations' for the same role. | The no-association state remains unchanged and no stale association is displayed. |

## Expected Outcome
Selecting a role with no learned magnet system association shows an empty learned-association state with no fabricated or carried-over association data, including after refresh and reopen.
