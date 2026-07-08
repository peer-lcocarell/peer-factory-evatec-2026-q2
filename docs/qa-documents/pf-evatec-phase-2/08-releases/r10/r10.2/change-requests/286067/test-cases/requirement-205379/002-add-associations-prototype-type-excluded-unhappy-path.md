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
| 4 | Cancel the add association action. | The dialog closes. The source component's existing associations are unchanged. |

## Expected Outcome
Prototype Magnet System Types are excluded from the association target list when adding a Magnet System role association. Only Standard Magnet System Types are selectable. The restriction is enforced without displaying an error — the Prototype simply does not appear as an option.
