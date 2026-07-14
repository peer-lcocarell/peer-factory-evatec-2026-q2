# R10.2 Update for CR 286067 - Return Magnet System: Attempt to return a Magnet System that is already In Stock (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `In Stock` exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and locate a Magnet System with status `In Stock`. | The Magnet System is displayed in the list with status `In Stock`. |
| 2 | Select the `In Stock` Magnet System and review available actions. | The 'Return' action is not available for a Magnet System with status `In Stock`. |

## Expected Outcome
The Return action is not available for Magnet Systems already in `In Stock` status. Only Magnet Systems in `Checked Out` or `In Inspection` status support the Return action.
