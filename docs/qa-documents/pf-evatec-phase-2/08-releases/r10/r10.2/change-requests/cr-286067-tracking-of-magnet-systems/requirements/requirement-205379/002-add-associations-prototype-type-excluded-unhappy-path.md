# R10.2 Update for CR 286067 - Add Associations: Attempt to add a Magnet System association using a Prototype Magnet System Type (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205379
Requirement: Add associations (Learned Associations)

## Preconditions
- User is signed in with `ManageHardware_View` and `ManageHardware_Edit` permissions.
- A Hardware Component eligible as an association source exists.
- A Prototype Magnet System Type exists in the system.
- The 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Learned Associations' and select a source Hardware Component. | The component is selected and the associations panel loads. |
| 2 | Trigger the 'Add Association' action and open the target selection for Magnet System role scope. | The target selection list opens. Only Standard Magnet System Types are displayed. Prototype Magnet System Types are not listed as eligible targets. |
| 3 | Attempt to locate and select a Prototype Magnet System Type as the association target. | The Prototype type is not available in the selection list. No Prototype can be selected. |
| 4 | Select one valid Standard Magnet System Type from the same selection list. | The Standard type is selectable and is added to the pending selection state. |
| 5 | Cancel the add association action. | The dialog closes. No new association is saved and the source component's existing associations remain unchanged. |
| 6 | Reopen 'Add Association' for the same source component and review available targets. | Prototype Magnet System Types remain excluded and Standard Magnet System Types remain available. |

## Expected Outcome
Prototype Magnet System Types are excluded from Magnet System role association targets, while valid Standard Magnet System Types remain selectable. Canceling the flow does not persist unintended changes.
