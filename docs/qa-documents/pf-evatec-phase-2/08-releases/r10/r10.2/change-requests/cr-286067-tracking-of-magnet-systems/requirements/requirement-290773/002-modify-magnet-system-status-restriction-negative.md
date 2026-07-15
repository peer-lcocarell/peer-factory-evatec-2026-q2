# R10.2 Update for CR 286067 - Modify Magnet System: Attempt to modify a Magnet System that is in a status that does not permit modification (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `In Use` exists (currently installed in a tool).
- At least one Magnet System with status `Retired` exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and locate a Magnet System with status `In Use`. | The Magnet System is visible in the list. |
| 2 | Select the `In Use` Magnet System and review available actions. | The 'Modify' action is not available for a Magnet System with status `In Use`. |
| 3 | Locate a Magnet System with status `Retired` in the list. | The Retired Magnet System is visible. |
| 4 | Select the `Retired` Magnet System and review available actions. | The 'Modify' action is not available for a Magnet System with status `Retired`. |

## Expected Outcome
The Modify action is not available for Magnet Systems in `In Use` or `Retired` status. Modification can only be triggered from permissible statuses. `In Use` and `Retired` Magnet Systems display no Modify action.
