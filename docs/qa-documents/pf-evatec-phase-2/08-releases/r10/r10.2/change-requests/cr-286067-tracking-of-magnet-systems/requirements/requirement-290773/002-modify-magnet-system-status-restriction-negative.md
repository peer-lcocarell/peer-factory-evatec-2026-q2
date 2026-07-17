# R10.2 Update for CR 286067 - Modify Magnet System: Attempt to modify a Magnet System that is in a status that does not permit modification (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `Checked Out` exists.
- At least one Magnet System with status `In Stock` exists.
- At least one Magnet System with status `In Use` exists (currently installed in a tool).
- At least one Magnet System with status `Retired` exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page. Locate a Magnet System with status `Checked Out` and review available actions. | The 'Modify' action is available for a Magnet System with status `Checked Out`. |
| 2 | Locate a Magnet System with status `In Stock` and review available actions. | The 'Modify' action is not available for a Magnet System with status `In Stock`. |
| 3 | Locate a Magnet System with status `In Use` and review available actions. | The 'Modify' action is not available for a Magnet System with status `In Use`. |
| 4 | Locate a Magnet System with status `Retired` and review available actions. | The 'Modify' action is not available for a Magnet System with status `Retired`. |
| 5 | Attempt direct navigation to modification functionality for an `In Use` Magnet System. | Access is denied. No modification is persisted. No history entry is created. |

## Expected Outcome
The Modify action is available only for Magnet Systems with status `Checked Out`. Magnet Systems in `In Stock`, `In Use`, or `Retired` status do not show the Modify action. Direct access to modification functionality is denied for disallowed states.
