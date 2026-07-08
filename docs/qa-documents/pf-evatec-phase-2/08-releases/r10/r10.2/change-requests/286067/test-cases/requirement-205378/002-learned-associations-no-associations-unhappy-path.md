# R10.2 Update for CR 286067 - Learned Associations: Verify no associations are displayed for a hardware component with no learned associations (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205378
Requirement: Learned Associations (Manage Hardware)

## Preconditions
- User is signed in with `ManageHardware_View` permission.
- At least one Hardware Component exists that has no learned associations recorded.
- The 'Manage Hardware' > 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and navigate to 'Learned Associations'. | The 'Learned Associations' screen loads. |
| 2 | Select a Hardware Component known to have no learned associations. | The component is selected and the associations panel loads. |
| 3 | Review the associations list. | The associations list is empty. A message indicating no associations exist is displayed. |
| 4 | Verify no association entries are present. | No role type, component name, or association metadata is displayed for this component. |

## Expected Outcome
Selecting a Hardware Component with no learned associations displays an empty associations list with an appropriate empty-state message. No association data is fabricated or carried over from other components.
