# R10.2 Update for CR 286067 - Remove Association: Verify tester can remove an existing hardware association (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205380
Requirement: Remove association (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- At least one Hardware Component with an existing learned association exists.
- The 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Learned Associations' and select a source Hardware Component. | The component is selected and existing associations are displayed. |
| 2 | Select an existing association from the list. | The 'Remove' action becomes available for the selected association. |
| 3 | Trigger the Remove action and confirm. | The association is removed from the list. |
| 4 | Refresh the associations view. | The removed association no longer appears. |
| 5 | Navigate to the Hardware Configuration install candidate list for the relevant role. | The removed item is no longer presented as a previously installed candidate. |

## Expected Outcome
An existing learned association is removed and the removal persists on refresh. The removed component is no longer offered as a previously installed candidate in Hardware Configuration assignment dialogs.
